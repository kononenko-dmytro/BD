package shop.jdbchandlers;

import shop.connector.Connector;
import shop.graphics.Warning;
import shop.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Queries {


    public static List<Product> getListByCriteria(List<String> criteria) {
        if (criteria.size() < 1) {
            return null;
        } else {
            try (Connection root = Connector.getConnection()) {
                try (PreparedStatement query = root.prepareStatement(
                        "SELECT products.product_id,\n" +
                                "       category_name,\n" +
                                "       name,\n" +
                                "       cost,\n" +
                                "       maintainer,\n" +
                                "       characteristics,\n" +
                                "       GROUP_CONCAT(s.address\n" +
                                "                    SEPARATOR '\n ') AS addresses\n" +
                                "\n" +
                                "FROM products\n" +
                                "         LEFT JOIN categories ON products.category_id = categories.category_id\n" +
                                "         LEFT JOIN description d ON products.product_id = d.product_id\n" +
                                "         LEFT JOIN shops_has_products shp ON products.product_id = shp.product_id\n" +
                                "         LEFT JOIN shops s ON shp.shop_id = s.shop_id\n" +
                                "WHERE category_name IN (?,?,?,?,?,?,?,?)\n" +
                                "GROUP BY products.product_id")) {
                    for (int i = 1; i < criteria.size() + 1; i++) {
                        query.setString(i, criteria.get(i - 1));
                    }
                    for (int i = criteria.size() + 1; i < 9; i++) {
                        query.setString(i, " ");
                    }
                    ResultSet resultSet = query.executeQuery();
                    List<Product> list = new ArrayList<>();
                    while (resultSet.next()) {
                        Long id = resultSet.getLong("product_id");
                        String categoryName = resultSet.getString("category_name");
                        String productName = resultSet.getString("name");
                        Double cost = resultSet.getDouble("cost");
                        String maintainer = resultSet.getString("maintainer");
                        String characteristics = resultSet.getString("characteristics");
                        String addresses = resultSet.getString("addresses");
                        list.add(new Product(id, categoryName, productName, cost, maintainer, characteristics, addresses));
                    }
                    return list;
                }

            } catch (SQLException e) {
                Warning.showErrorWithHeaderText("Can`t get connection");
            }
        }
        return null;
    }
}
