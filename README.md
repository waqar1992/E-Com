# E-Com


This is a demo Products Browsing app written with VIPER Architecture using Swift 5+ , XCode 11.6

![demo]()

## About VIPER

### Viper Components

Each VIPER module consists of the following parts:

View (View, ViewController)
Interactor (Business Logic, Use Cases)
Presenter (Prepare Business logic for presentation in the View)
Entity (Model)
Router (Assemble each module and Take control of Routing)

### Dependency Graph

The dependence graph is unidirectional, which means:
View knows about Presenter
Presenter knows about Router and Interactor
Interactor communicates with Database/Repository

### Dependency Inversion (Feedback Loop)

However, when we want to inform the outer layer changes of the inner layer, a feedback channel needs to be created to bring info from inside of the onion out. This can be achieved in several ways. Using Rx Binding, closure (blocks) or like what we do here, using delegates (protocols).

We use ViewProtocol to communicate back from Presenter to View and OutputInteractorProtocol to communicate back from Interactor to Presenter.

## About the Demo App

It is a simple app which fetches products and display them in collectionview. User can filter the product from either search or he can use filter menu to filter the products



