package shop.model;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.ArrayList;
import java.util.List;

public class Collections {
    public static final ObservableList<Product> productsObservableList = FXCollections.observableArrayList();
    public static final ArrayList<Product> productsList = new ArrayList<>();

    public static void addAll(List<Product> list) {
        productsList.addAll(list);
        productsObservableList.addAll(productsList);
    }

    public static void clearAll(){
        productsList.clear();
        productsObservableList.clear();
    }

    public static void reset(){

    }
}
