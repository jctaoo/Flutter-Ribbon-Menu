# Office Style Ribbon Menu in Flutter
This package should enable you to use the ribbon menu from tools like Microsoft Office or others in your Flutter app. Although this package could run on mobile devices, it's focus is on desktop applications.

The mostly follows the implementation of the WPF ribbon controls for Windows with a few changes.

Feel free to create pull requests, file issues or fork the project.

![Ribbon menu screenshot](images/word_style_screenshot.png "Ribbon menu screenshot")
![Example application menu screenshot](images/example-application-menu_screenshot.png "appication menu screenshot")

## Features
- Easy to implement Ribbon Menu commonly known from office products and other windows software to use in flutter
- Many predefined ribbon specific widgets
- Highly customizable through your newly created flutter widgets
- Working on Windows, Linux and MacOS platforms

## Roadmap
- [x] Instantiating a ribbon menu
- [x] Adding multiple tabs and switching between them
- [x] Grouping of multiple buttons or other widgets with a group label and a vertical divider
- [x] Large and small ribbon buttons
- [x] Large ribbon button as dropdown menu (thanks to [this](https://medium.com/saugo360/https-medium-com-saugo360-flutter-using-overlay-to-display-floating-widgets-2e6d0e8decb9) medium article from the creator of the flutter typeahead package)
- [x] Expanding so called "application menu" on the first ribbon tab
- [ ] Adapt look & feel to office style
- [ ] Add some more common widgets
- [ ] Automatic resizing if vertical space shrinks
- [ ] Collapsible ribbon menu
- [ ] Fully implement an example ribbon menu like in Microsoft Word
- [ ] Support for normal keyboard shortcuts and <kbd>Alt</kbd> shortcuts
