#include <SFML/Graphics.hpp>
#include <SFML/System.hpp>
#include <SFML/Window.hpp>


int main()
{
   constexpr sf::Vector2f WINDOW_SIZE{500,500};
   sf::RenderWindow window{sf::VideoMode{sf::Vector2u{WINDOW_SIZE}}, "My Window"};


   while (window.isOpen())
   {
      window.handleEvents(
         [&](const sf::Event::Closed &)
         {
            window.close();
         }
      );
      window.clear();
      // draw objects
      window.display();
   }
}
