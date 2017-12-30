public class Pizza {

private String[] toppings;
private float diameter;
private float price;


public Pizza () {
System.out.println("hey");

}

public Pizza(String[] toppings, float diameter, float price) {
System.out.println("in overloaded cstr");
}


public void assemble () {

}

public void setPrices(float price){
	if (price > 0 && price < 50) {
		this.price = price;
	}
}

public float getPrice () {
	return price;
}



public static void main(String[]args) {
Pizza p = new Pizza();

}



}


public class Controller {

	private pizza p;

	public Controller () {
	}

	public Controller(Pizza p) {
		this.p = p;
		system.out.println(p.getPrice);
	}



	public static void main(String[]args) {
		Controller p = new Controller();
	}


}