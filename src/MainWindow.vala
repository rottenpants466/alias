using Granite.Widgets;

namespace Application {
public class MainWindow : Gtk.Window{

    private ListManager listManager = ListManager.get_instance();
    private StackManager stackManager = StackManager.get_instance();

    private HeaderBar headerBar = HeaderBar.get_instance();

    construct {
        set_default_size(Constants.APPLICATION_WIDTH, Constants.APPLICATION_HEIGHT);
        set_titlebar (headerBar);

        stackManager.loadViews(this);

        listManager.getList().getRepositories("");

        addShortcuts();
    }

    private void addShortcuts(){
        key_press_event.connect ((e) => { 
            switch (e.keyval) { 
                case Gdk.Key.a:
                    if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {  
                    }
                    break;
                case Gdk.Key.h:
                    if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {  
                        new Cheatsheet(); 
                    }
                    break;
                case Gdk.Key.f:    
                  if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {  
                    headerBar.searchEntry.grab_focus();
                  }
                  break;
            }

            return false; 
        });
    }
}
}
