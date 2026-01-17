import UIKit

class CoffeeDetailViewController: UIViewController {

    var drink: CoffeeDrink?

    @IBOutlet weak var americanLabel: UILabel!
    @IBOutlet weak var italianLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "How to order in 🇮🇹"
        view.backgroundColor = .systemBackground

        guard let drink = drink else { return }
        americanLabel.text = "🇺🇸: \(drink.americanName)"
        italianLabel.text = "🇮🇹: \(drink.italianName)"
        descriptionLabel.text = drink.description
    }
}
