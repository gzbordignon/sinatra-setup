mangas = ["Berserk", "Hunter x Hunter", "One Piece"]

mangas.each do |manga|
	Manga.create(name: manga)
end