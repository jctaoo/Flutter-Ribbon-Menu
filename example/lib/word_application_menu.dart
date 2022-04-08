import "package:flutter/material.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_button.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_dropdown_button.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_dropdown_item.dart";
import "package:ribbon_menu/ribbon_application_menu.dart";

class WordApplicationMenu extends StatelessWidget {
  const WordApplicationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RibbonApplicationMenu(
      buttonLabel: "File",
      closeAction: () {},
      menuItems: [
        RibbonApplicationMenuDropdownButton(
          onPressed: () {},
          icon: const Icon(Icons.window),
          label: "Open new window",
          items: [
            RibbonApplicationMenuDropdownItem(
              onPressed: () {},
              icon: const Icon(Icons.window_outlined),
              label: "Open new Terminal",
            ),
            RibbonApplicationMenuDropdownItem(
              onPressed: () {},
              icon: const Icon(Icons.window_outlined),
              label: "Open new Terminal in Process",
            ),
          ],
        ),
        RibbonApplicationMenuDropdownButton(
          onPressed: () {},
          icon: const Icon(Icons.code),
          label: "Open Windows PowerShell",
          items: const [
            RibbonApplicationMenuDropdownItem(
              icon: Icon(Icons.code),
              label: "Open Windows PowerShell",
            ),
            RibbonApplicationMenuDropdownItem(
              icon: Icon(Icons.admin_panel_settings),
              label: "Open Windows PowerShell as administrator",
            )
          ],
        ),
        const Divider(
          height: 8,
          indent: 52,
          color: Colors.grey,
        ),
        RibbonApplicationMenuButton(
          icon: const Icon(Icons.list_alt),
          label: "Change folder and search options",
          onPressed: () {},
        ),
        RibbonApplicationMenuDropdownButton(
          onPressed: () {},
          icon: const Icon(
            Icons.help,
            color: Colors.blue,
          ),
          label: "Help",
          items: const [
            RibbonApplicationMenuDropdownItem(
              icon: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              label: "Help",
            ),
            RibbonApplicationMenuDropdownItem(
              icon: Icon(
                Icons.info,
                color: Colors.blue,
              ),
              label: "About windows",
            )
          ],
        ),
        RibbonApplicationMenuButton(
          onPressed: () {},
          label: "Exit",
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
