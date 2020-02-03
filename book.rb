def register_book(a_books)
  # 本の著者、タイトル、価格をユーザーに入力させ、保存する
  puts '著者を入力してください'
  writer = gets.chomp
  puts 'タイトルを入力してください'
  title = gets.chomp
  puts '価格を入力してください'
  price = gets.to_i

  book = {
    writer: writer, 
    title: title, 
    price: price
  }

  a_books << book
  puts "登録ができました"
end

def show_books(a_books)
  average_price(a_books)
  puts "見たい番号を入力してください"
  0
  # 保存された本の一覧を出力する
  a_books.each_with_index do |book, index|
    puts "#{index + 1}: #{book[:title]}"
  end
  int = gets.to_i
  show_detail(a_books[int - 1])
end

def show_detail(book)
  # 選択された本の詳細な情報（著者、タイトル、価格）を出力する
  line = "-------------------------------------"
  puts "#{line}\n著者：#{book[:writer]}\n#{line}\nタイトル：#{book[:title]}\n#{line}\n価格：#{book[:price]}\n#{line}"
end

def average_price(a_books)
  # 全ての本の平均価格を算出する
  avg = 0
  sum = 0
  a_books.each do |book|
    sum += book[:price]
  end

  avg = sum / a_books.length
  puts "登録されている本の平均価格は#{avg}円です"
end

a_books = []
while true do
  puts "番号を入力してください"
  puts "1: 本を登録する"
  puts "2: 本の一覧を見る"
  puts "3: 終了する"
  case gets.to_i
  when 1
    register_book(a_books)
  when 2
    show_books(a_books)
  when 3
    exit
  else
    puts '無効な値です'
  end
end