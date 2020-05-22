package shop.jdbchandlers;

import shop.connector.Connector;
import shop.graphics.Warning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class Updates {

    public static void removeProducts(List<Long> list) {
        if (list.size() != 0) {
            try (Connection root = Connector.getConnection()) {
                StringBuilder stringBuilder = new StringBuilder();
                for (int i = 0, length = list.size(); i < length; i++) {
                    if (!(i == length - 1)) {
                        stringBuilder.append(list.get(i)).append(",");
                    } else {
                        stringBuilder.append(list.get(i));
                    }
                }

                String query1 = "DELETE FROM shops_has_products WHERE product_id IN(" + stringBuilder + ");";
                try (PreparedStatement query = root.prepareStatement(query1)) {
                    query.executeUpdate();
                }

                query1 = "DELETE FROM description WHERE product_id IN(" + stringBuilder + ");";
                try (PreparedStatement query = root.prepareStatement(query1)) {
                    query.executeUpdate();
                }

                query1 = "DELETE FROM products WHERE product_id IN(" + stringBuilder + ");";
                try (PreparedStatement query = root.prepareStatement(query1)) {
                    query.executeUpdate();
                }

            } catch (SQLException e) {
                Warning.showErrorWithHeaderText("Error while deleting rows");
            }
        }
    }

    public static void updateCategoryName(Long productId, String categoryName) {
        try (Connection root = Connector.getConnection()) {
            String s1 = categoryName.substring(0, 1).toUpperCase();
            String newCategoryName = s1 + categoryName.substring(1);
            int size = 0;

            try (PreparedStatement query = root.prepareStatement("SELECT category_name FROM categories WHERE category_name = ?")) {
                query.setString(1, newCategoryName);
                ResultSet resultSet = query.executeQuery();
                if (resultSet != null) {
                    resultSet.last();
                    size = resultSet.getRow();
                }
                if (size == 0) {
                    try (PreparedStatement query1 = root.prepareStatement("INSERT INTO categories(category_id,category_name) VALUES (0,?)")) {
                        query1.setString(1, newCategoryName);
                        query1.executeUpdate();
                    }
                }
                try (PreparedStatement query1 = root.prepareStatement("SELECT category_id FROM categories WHERE category_name = ?")) {
                    query1.setString(1, newCategoryName);
                    ResultSet resultSet1 = query1.executeQuery();
                    resultSet1.next();
                    long categoryId = resultSet1.getLong(1);

                    try (PreparedStatement query2 = root.prepareStatement("UPDATE products SET category_id = ? WHERE product_id = ?")) {
                        query2.setLong(1, categoryId);
                        query2.setLong(2, productId);
                        query2.executeUpdate();

                    }
                }
            }

        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while updating category");
        }
    }

    public static void updateProductName(Long productId, String productName) {
        try (Connection root = Connector.getConnection()) {
            String s1 = productName.substring(0, 1).toUpperCase();
            String newProductName = s1 + productName.substring(1);

            try (PreparedStatement query2 = root.prepareStatement("UPDATE products SET name = ? WHERE product_id = ?")) {
                query2.setString(1, newProductName);
                query2.setLong(2, productId);
                query2.executeUpdate();
            }

        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while updating product name");
        }
    }

    public static void updateCost(Long productId, Double cost) {
        try (Connection root = Connector.getConnection()) {
            try (PreparedStatement query2 = root.prepareStatement("UPDATE products SET cost = ? WHERE product_id = ?")) {
                query2.setDouble(1, cost);
                query2.setLong(2, productId);
                query2.executeUpdate();
            }
        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while updating cost");
        }
    }

    public static void updateMaintainer(Long productId, String maintainer) {
        try (Connection root = Connector.getConnection()) {
            String s1 = maintainer.substring(0, 1).toUpperCase();
            String newMaintainer = s1 + maintainer.substring(1);
            try (PreparedStatement query2 = root.prepareStatement("UPDATE description SET maintainer = ? WHERE product_id = ?")) {
                query2.setString(1, newMaintainer);
                query2.setLong(2, productId);
                query2.executeUpdate();
            }
        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while updating maintainer");
        }
    }

    public static void updateCharacteristics(Long productId, String characteristics) {
        try (Connection root = Connector.getConnection()) {
            try (PreparedStatement query2 = root.prepareStatement("UPDATE description SET characteristics = ? WHERE product_id = ?")) {
                query2.setString(1, characteristics);
                query2.setLong(2, productId);
                query2.executeUpdate();

            }
        } catch (SQLException e) {
            Warning.showErrorWithHeaderText("Error while updating characteristics");
        }
    }
}
