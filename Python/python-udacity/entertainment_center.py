import media
import fresh_tomatoes

toy_story = media.Movie("Toy story", "a story of boy and his toys","https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj4_ebX1J_OAhWELmMKHRW4DUIQjRwIBw&url=http%3A%2F%2Fwww.dailyedge.ie%2Ftoy-story%2Fnews%2F&psig=AFQjCNFAwu2frXtC5C6qCESwbjX0f3AYEQ&ust=1470121817416680","https://www.youtube.com/watch?v=KYz2wyBy3kc")
#print(toy_story.storyline)
#toy_story.show_trailer()
movies = [toy_story]
fresh_tomatoes.open_movies_page(movies)
