package shop.jdbchandlers;

import shop.connector.Connector;
import shop.graphics.Warning;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class ScriptExecutor {

    public static void execute(String sqlScript) {
        List<String> list = null;
        try {
            list = readSQLScript(ScriptExecutor.class.getResource(sqlScript).getPath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        try (Connection root = Connector.getConnection()) {
            if (list != null) {
                for (String queryString : list) {
                    try (PreparedStatement query = root.prepareStatement(queryString)) {
                        query.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while reading sql script");
        }
    }

    private static List<String> readSQLScript(final String pathToFile) throws IOException {
        List<String> statements = new ArrayList<>();
        FileInputStream fileReader = new FileInputStream(pathToFile);
        byte[] buffer = new byte[fileReader.available()];
        if (fileReader.read(buffer, 0, fileReader.available()) == -1) {
            return null;
        }
        StringBuilder query = new StringBuilder();
        for (byte b : buffer) {
            query.append((char) b);
        }
        String filteredQuery = query.toString();
        filteredQuery = filteredQuery.replace("\n", " ").replaceAll("\\s{2,}", "");
        StringTokenizer stringTokenizer = new StringTokenizer(filteredQuery, ";");
        while (stringTokenizer.hasMoreTokens()) {
            statements.add(stringTokenizer.nextToken() + ";");
        }
        return statements;
    }
}
