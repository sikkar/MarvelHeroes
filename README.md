# marvelheroes

Marvel Heroes App.

This app was built using the marvel heroes API to show a list of characters and detailed information when selecting one of them.

I started implementing the generic classes and protocols so the project might be easier to expand with new features in the future. The idea is just to add a new module for each functionality and implementing the basic protocols in the new classes of that module so that should provide an easier and faster way to develop new ideas for the app.

The app is developed using an MVP architectural pattern expanded to use a Router (MVP+R) to organize a little further the way to navigate between views. I also implemented a Transition protocol and a factory in case we want a different transition animation between view controllers in the future. Each module also uses a builder so it can be easier to create.

I added some integration tests for the home presenter as well.

With more time an important thing to do would be to add more test coverage for all classes. Also with the possibilities of the API, we could do much more things like show heroes detailed information in lots of different ways, detailed list of comics, series, etc...
