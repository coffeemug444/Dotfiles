#include <SFML/Graphics.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/System/Vector2.hpp>
#include <SFML/Window/Event.hpp>
#include <SFML/Window/VideoMode.hpp>



int main()
{
   sf::RenderWindow window{sf::VideoMode{sf::Vector2u{500,500}}, "My Window"};

   window.display();

   while (window.isOpen())
   {
      window.handleEvents(
         [&](const sf::Event::Closed &)
         {
            window.close();
         }
      );
   }
}
