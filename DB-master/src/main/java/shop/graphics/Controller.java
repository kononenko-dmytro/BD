package shop.graphics;

import shop.Main;
import shop.connector.Connector;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class Controller {

    @FXML
    private TextField loginField;

    @FXML
    private PasswordField passwordField;

    @FXML
    private Button authSignInButton;

    @FXML
    void initialize() {
        authSignInButton.setOnAction(actionEvent -> {
            String loginS = loginField.getText();
            String passwordS = passwordField.getText();
            Connector.setProperties(loginS, passwordS);
            if (Connector.getConnection() != null) {
                authSignInButton.getScene().getWindow().hide();
                FXMLLoader loader = new FXMLLoader();
                loader.setLocation(getClass().getResource("/app.fxml"));
                AppController.loadFXML(loader);

            }
        });

    }

    public static void main(String[] args) {
        Main.app(args);
    }
}