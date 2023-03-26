import Foundation

struct Post {
    var title: String = ""
    var author: String = ""
    var description: String = ""
    var image: String = ""
    var likes: Int = 0
    var views: Int = 0
}

extension Post {

    static func pull() -> [Post] {
        [
            Post(
                author: "Натан Альтман. Портрет Ахматовой",
                description: "1915. Холст, масло. 123 x 103 см. Картина поступила в 1920 году из собраний А.В. и Ж.Л. Румановых (Петроград). Экспонирование: Корпус Бенуа, Зал 72. Ко времени создания портрета Анна Андреевна Ахматова (1889–1966) уже была прославленным поэтом. Образ, созданный художником, сохранил ярко выразительную внешность Ахматовой и свойства оригинального характера, сочетающего особую закрытость, утонченность натуры и черты величавости и даже царственности. В обширной галерее портретов Ахматовой (от А. Модильяни до К. С. Петрова-Водкина) это произведение – одно из лучших. Художник создает образ экспрессивными живописными средствами: контрастами цвета, угловатостью линий, несколько кубизированными – в духе времени – формами.",
                image: "ArtAltman",
                likes: 1207,
                views: 5090
            ),
            Post(
                author: "Марк Шагал. Прогулка",
                description: "1917. Холст, масло. 170 х 163,5 см. Картина поступила в 1920 из Государственного музейного фонда отдела ИЗО Наркомпрос. В 1917–1918 годах Шагалом был создан цикл живописных произведений, представляющих автопортрет с молодой женой художника, Беллой. «Прогулка» принадлежит, несомненно, к наиболее светлым и радостным картинам этого цикла. Мотив полета, возникающий в этом цикле, обретает в «Прогулке» самое живое, непосредственное воплощение и простое, ясное, быть может, объяснение: влюбленным просто мало земли, и Белла взмывает ввысь, к небу. Полотно вообще пронизано многообразными авторскими метафорами: это и чудесный натюрморт на красной скатерти, напоминающий о брачном пиршестве, и нежная, едва расцветшая ветка на фоне неба, и птичка, зажатая в руке молодого мужчины.",
                image: "ArtShagal",
                likes: 3379,
                views: 7450
            ),
            Post(
                author: "Борис Кустодиев. Купчиха за чаем",
                description: "1918. Холст, масло. 120 x 120 см. Картина поступила в 1925 году из ГМФ, Ленинград. Экспонирование: Корпус Бенуа, Зал 71. Свой идеал женской красоты Кустодиев нашел в купеческом сословии. Интересно, что, в отличие от Мыльникова или Венецианова, не создавший ни одного натурного портрета русских купчих, он «списывал» своих героинь с дам интеллигентного круга – Н. И. Зеленской («Купчихи», 1912), Ф. В. Шевченко («Красавица», 1915), Г. Адеркас («Купчиха за чаем», 1918), чей облик, по ощущениям художника, был близок народному идеалу красоты. Все героини – замужние пышнотелые молодые женщины в возрасте около тридцати лет – показаны в характерной для них среде. Художник «демонстрирует» красавиц – их дородные фигуры помещены в центре картин, приближены к первому плану, подчиняя себе пейзажную и интерьерную среду.",
                image: "ArtKustodiev",
                likes: 514,
                views: 8432
            ),
            Post(
                author: "Казимир Малевич. Спортсмены",
                description: "1928–1932. Холст, масло. 142 x 164 см. Картина поступила в 1936 от наследников (Ленинград). Передана в 1977 МК СССР. Экспонирование: Корпус Бенуа, Зал 76. Художник разработал особую теорию абстрактного искусства – супрематизм. По мысли автора, создаваемые им супрематические композиции должны были отражать «раскрепощение художника из подражательного подчинения вещи к непосредственному изобретению творчества». Фигуры в картине «Спортсмены» всецело подчинены задаче цветовой и ритмической организации композиции, отчужденной от реального смысла бытия и направленной на концентрацию собственных динамики и энергии, преодолевающих категории времени и пространства. Цветовое и композиционное построение холста подчинено принципам симметрии, безликость персонажей призвана подчеркнуть глобальное космическое восприятие мира, представление автора о сверхличностной сущности искусства, никак не зависящей от индивидуальности ни художника, ни зрителя.",
                image: "ArtMalevich",
                likes: 3503,
                views: 9800
            ),
            Post(
                author: "Василий Поленов. Московский дворик",
                description: "1902. Холст, масло. 55,2 x 44 см. Экспонирование: Михайловский дворец, Зал 32. Поленов часто обращался к повторению своих произведений. Коллекции Русского музея принадлежит один из поздних вариантов его широко известной картины 1878 года Московский дворик. Художник изображает типичный уголок старой Москвы. Поэзия мирного бытия, радостное мироощущение, любование неспешным, чуть ленивым течением жизни наполняют полотно. Пейзаж и жанр выступают в тесной взаимосвязи. Особое значение картины и для творчества художника, и для русского пейзажа заключается в том, что в ней мастерство Поленова-пленэриста раскрылось в полной мере. Избегая темных тонов, он пишет светлыми красками, приглушая их рефлексами, избегает контрастов цвета. Живопись пронизана светом, пространство наполнено воздухом. Картина стала своего рода символом старой Москвы.",
                image: "ArtPolenov",
                likes: 8381,
                views: 10400
            ),
        ]
    }
}
