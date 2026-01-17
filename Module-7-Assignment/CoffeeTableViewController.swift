import UIKit

class CoffeeTableViewController: UITableViewController {

    private let drinks: [CoffeeDrink] = [
        CoffeeDrink(americanName: "Drip Coffee", italianName: "Caffè Americano", description: "Espresso diluted with hot water."),
        CoffeeDrink(americanName: "Latte", italianName: "Caffè Latte", description: "Espresso with steamed milk."),
        CoffeeDrink(americanName: "Cappuccino", italianName: "Cappuccino", description: "Equal parts espresso, milk, and foam."),
        CoffeeDrink(americanName: "Flat White", italianName: "Latte (Australia-inspired)", description: "Less foam, more milk than a cappuccino."),
        CoffeeDrink(americanName: "Espresso Shot", italianName: "Caffè", description: "A single shot of espresso."),
        CoffeeDrink(americanName: "Double Espresso", italianName: "Doppio", description: "Two shots of espresso."),
        CoffeeDrink(americanName: "Macchiato", italianName: "Caffè Macchiato", description: "Espresso with a small amount of foam."),
        CoffeeDrink(americanName: "Mocha", italianName: "Caffè Mocha", description: "Espresso with chocolate and milk."),
        CoffeeDrink(americanName: "Iced Coffee", italianName: "Caffè Freddo", description: "Chilled espresso-based drink."),
        CoffeeDrink(americanName: "Cold Brew", italianName: "Caffè Freddo (Modern)", description: "Cold-steeped coffee served chilled.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🇺🇸 to 🇮🇹 Coffee Names"

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath)

        let drink = drinks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = drink.americanName
        content.secondaryText = nil   
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCoffeeDetail" {
            guard
                let detailVC = segue.destination as? CoffeeDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow
            else { return }

            detailVC.drink = drinks[indexPath.row]
        }
    }
}
