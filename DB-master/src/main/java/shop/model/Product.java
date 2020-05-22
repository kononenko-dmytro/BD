package shop.model;

public class Product {
    private Long id;
    private String categoryName;
    private String productName;
    private Double cost;
    private String maintainer;
    private String characteristics;
    private String addresses;

    public Product() {
    }

    public Product(Long id, String categoryName, String productName, Double cost, String maintainer, String characteristics, String addresses) {
        this.id = id;
        this.categoryName = categoryName;
        this.productName = productName;
        this.cost = cost;
        this.maintainer = maintainer;
        this.characteristics = characteristics;
        this.addresses = addresses;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getMaintainer() {
        return maintainer;
    }

    public void setMaintainer(String maintainer) {
        this.maintainer = maintainer;
    }

    public String getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(String characteristics) {
        this.characteristics = characteristics;
    }

    public String getAddresses() {
        return addresses;
    }

    public void setAddresses(String addresses) {
        this.addresses = addresses;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", productName='" + productName + '\'' +
                ", cost=" + cost +
                ", maintainer='" + maintainer + '\'' +
                ", characteristics='" + characteristics + '\'' +
                ", addresses='" + addresses + '\'' +
                '}';
    }
}
