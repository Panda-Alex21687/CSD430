<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>

<%!
    /*
     * Converts special HTML characters into safe text before values
     * from the database are displayed on the web page.
     */
    public String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>

<%
    /*
     * Database connection information used by the existing
     * Modules 5 & 6, 7, and 8 movie database project.
     */
    String databaseUrl =
            "jdbc:mysql://localhost:3306/CSD430?useSSL=false";

    String databaseUser = "student1";
    String databasePassword = "pass";

    /*
     * This is the same movie table used in the previous modules.
     */
    String tableName = "alexmoviesdata";

    /*
     * Each String array stored in this ArrayList represents one
     * movie record that will be displayed in the dropdown and table.
     */
    ArrayList<String[]> movieRecords =
            new ArrayList<String[]>();

    String successMessage = "";
    String errorMessage = "";

    /*
     * Reads the selected primary key from the HTML form.
     */
    String selectedMovieId =
            request.getParameter("movie_id");

    /*
     * The record is deleted only when the page receives a POST request.
     */
    boolean formSubmitted =
            "POST".equalsIgnoreCase(request.getMethod());

    Connection connection = null;
    PreparedStatement deleteStatement = null;
    Statement selectStatement = null;
    ResultSet resultSet = null;

    try {
        /*
         * Loads MySQL Connector/J 5.1.49.
         */
        Class.forName("com.mysql.jdbc.Driver");

        /*
         * Opens a connection to the existing CSD430 database.
         */
        connection = DriverManager.getConnection(
                databaseUrl,
                databaseUser,
                databasePassword
        );

        /*
         * Deletes the record selected in the dropdown.
         * A PreparedStatement is used so the key value is handled safely.
         */
        if (formSubmitted) {
            if (selectedMovieId != null
                    && !selectedMovieId.trim().isEmpty()) {

                try {
                    int movieId =
                            Integer.parseInt(
                                    selectedMovieId.trim()
                            );

                    String deleteSql =
                            "DELETE FROM "
                            + tableName
                            + " WHERE movie_id = ?";

                    deleteStatement =
                            connection.prepareStatement(deleteSql);

                    deleteStatement.setInt(1, movieId);

                    int numberDeleted =
                            deleteStatement.executeUpdate();

                    if (numberDeleted > 0) {
                        successMessage =
                                "Movie record "
                                + movieId
                                + " was deleted successfully.";
                    } else {
                        errorMessage =
                                "The selected movie record was not found.";
                    }

                } catch (NumberFormatException exception) {
                    errorMessage =
                            "The selected movie ID was not valid.";
                }

            } else {
                errorMessage =
                        "Please select a movie record to delete.";
            }
        }

        /*
         * Selects every record that remains after the delete operation.
         * These records are displayed in both the dropdown and table.
         */
        String selectSql =
                "SELECT movie_id, title, director, "
                + "release_year, genre, rating "
                + "FROM "
                + tableName
                + " ORDER BY movie_id";

        selectStatement =
                connection.createStatement();

        resultSet =
                selectStatement.executeQuery(selectSql);

        /*
         * Copies each database record into the ArrayList.
         */
        while (resultSet.next()) {
            String[] movie = new String[6];

            movie[0] =
                    String.valueOf(
                            resultSet.getInt("movie_id")
                    );

            movie[1] =
                    resultSet.getString("title");

            movie[2] =
                    resultSet.getString("director");

            movie[3] =
                    String.valueOf(
                            resultSet.getInt("release_year")
                    );

            movie[4] =
                    resultSet.getString("genre");

            movie[5] =
                    resultSet.getString("rating");

            movieRecords.add(movie);
        }

    } catch (ClassNotFoundException exception) {
        errorMessage =
                "The MySQL JDBC driver could not be loaded. "
                + "Make sure mysql-connector-java-5.1.49.jar "
                + "is inside WEB-INF/lib.";

    } catch (Exception exception) {
        errorMessage =
                "Database error: "
                + exception.getMessage();

    } finally {
        /*
         * Closes each database resource after it is used.
         */
        try {
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (Exception exception) {
            // The resource could not be closed.
        }

        try {
            if (selectStatement != null) {
                selectStatement.close();
            }
        } catch (Exception exception) {
            // The resource could not be closed.
        }

        try {
            if (deleteStatement != null) {
                deleteStatement.close();
            }
        } catch (Exception exception) {
            // The resource could not be closed.
        }

        try {
            if (connection != null) {
                connection.close();
            }
        } catch (Exception exception) {
            // The resource could not be closed.
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Delete Movie Records</title>

    <link rel="stylesheet"
          href="alexstyle.css">
</head>

<body>

<div class="page-container">

    <header>
        <h1>Delete Movie Records</h1>

        <p class="description">
            This page displays every record currently stored in the
            Alex Movies database table. Select a movie ID from the
            dropdown menu and submit the form to delete that record.
            After the deletion, the table and dropdown will immediately
            display all remaining movie records.
        </p>
    </header>

    <% if (!successMessage.isEmpty()) { %>

        <div class="success-message">
            <%= escapeHtml(successMessage) %>
        </div>

    <% } %>

    <% if (!errorMessage.isEmpty()) { %>

        <div class="error-message">
            <%= escapeHtml(errorMessage) %>
        </div>

    <% } %>

    <section class="delete-section">

        <h2>Select a Movie Record to Delete</h2>

        <p>
            The dropdown contains the primary key and title for each
            movie record currently stored in the database.
        </p>

        <form action="alexMoviedelete.jsp"
              method="post"
              class="delete-form">

            <label for="movie_id">
                Movie record:
            </label>

            <select id="movie_id"
                    name="movie_id"
                    required
                    <%= movieRecords.isEmpty()
                            ? "disabled"
                            : "" %>>

                <% if (movieRecords.isEmpty()) { %>

                    <option value="">
                        No movie records are available
                    </option>

                <% } else { %>

                    <option value=""
                            selected
                            disabled>
                        Select a movie ID
                    </option>

                    <% for (String[] movie : movieRecords) { %>

                        <option value="<%= escapeHtml(movie[0]) %>">
                            ID <%= escapeHtml(movie[0]) %>
                            -
                            <%= escapeHtml(movie[1]) %>
                        </option>

                    <% } %>

                <% } %>

            </select>

            <button type="submit"
                    class="delete-button"
                    <%= movieRecords.isEmpty()
                            ? "disabled"
                            : "" %>>
                Delete Selected Movie
            </button>

        </form>

        <% if (!movieRecords.isEmpty()) { %>

            <p class="warning">
                Warning: The selected movie will be permanently
                removed from the database.
            </p>

        <% } %>

    </section>

    <section class="records-section">

        <h2>Current Movie Records</h2>

        <p>
            The table displays the movie ID, title, director,
            release year, genre, and rating for every record
            remaining in the database.
        </p>

        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Movie ID</th>
                        <th>Movie Title</th>
                        <th>Director</th>
                        <th>Release Year</th>
                        <th>Genre</th>
                        <th>Rating</th>
                    </tr>
                </thead>

                <tbody>

                    <% for (String[] movie : movieRecords) { %>

                        <tr>
                            <td>
                                <%= escapeHtml(movie[0]) %>
                            </td>

                            <td>
                                <%= escapeHtml(movie[1]) %>
                            </td>

                            <td>
                                <%= escapeHtml(movie[2]) %>
                            </td>

                            <td>
                                <%= escapeHtml(movie[3]) %>
                            </td>

                            <td>
                                <%= escapeHtml(movie[4]) %>
                            </td>

                            <td>
                                <%= escapeHtml(movie[5]) %>
                            </td>
                        </tr>

                    <% } %>

                </tbody>

            </table>

        </div>

        <% if (movieRecords.isEmpty()) { %>

            <p class="empty-message">
                All movie records have been deleted. The table heading
                remains visible, but there are no records to display.
            </p>

        <% } %>

    </section>

    <nav class="navigation">
        <a href="alexindex.jsp">
            Return to Project Home
        </a>
    </nav>

</div>

</body>
</html>