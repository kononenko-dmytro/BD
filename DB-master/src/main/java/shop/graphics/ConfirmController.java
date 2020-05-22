package shop.graphics;


import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class ConfirmController {

    @FXML
    private Button yesButton;

    @FXML
    private Button noButton;

    @FXML
    void initialize() {

        yesButton.setOnAction(actionEvent -> {
            AppController.confirm = true;
            yesButton.getScene().getWindow().hide();
        });

        noButton.setOnAction(actionEvent -> {
            AppController.confirm = false;
            yesButton.getScene().getWindow().hide();
        });
    }
}
