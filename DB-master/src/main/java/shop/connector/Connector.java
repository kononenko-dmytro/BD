package shop.connector;

import shop.graphics.Warning;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Connector {
    public static final String configPath = "/datasource.properties";

    public static Connection getConnection() {
        var props = loadProperties();
        String url = props.getProperty("mysql.database.url");
        String user = props.getProperty("mysql.user");
        String password = props.getProperty("mysql.password");
        Connection root = null;
        try {
            root = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Incorrect user and password for database");
        }
        return root;
    }

    private static Properties loadProperties() {
        var props = new Properties();
        try (var input = Connector.class.getResourceAsStream(configPath)) {
            props.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return props;
    }

    public static void setProperties(String login, String password) {
        try (var input = Connector.class.getResourceAsStream(configPath)) {
            var props = new Properties();
            props.load(input);
            props.setProperty("mysql.user", login);
            props.setProperty("mysql.password", password);
            props.store(new FileWriter(Connector.class.getResource(configPath).getFile()), "Props");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
