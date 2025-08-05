import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floristeria Flor de Loto',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  int _currentIndex = 0;

  // Páginas correspondientes a cada item del BottomNavigationBar
  final List<Widget> _pages = [
  ProductListScreen(),
  CouponsScreen(),
  ChatAssistantScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    toolbarHeight: 100,
    leading: Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          icon: const Icon(
            Icons.account_circle, 
            size: 50,
            color: Colors.indigo,
            ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    ),
  title: Center(
    child: Image.asset(
      'assets/flor_de_loto_logo.png',
      height: 120,
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        icon: const Icon(
          Icons.menu,
          size: 50,
          color: Colors.indigo,
        ),
        onPressed: () {},
      ),
    ),
  ],
),


      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 310,
              child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://imagenes.20minutos.es/files/image_990_556/uploads/imagenes/2024/10/30/flores-ramos-todos-santos.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black54, BlendMode.darken),
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('profile.jpg'),
                   ),
                  const SizedBox(height: 16),
                  const Text(
                    'Johana Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'johana.doe@example.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.indigo),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.indigo),
              title: const Text('Mi perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.category, color: Colors.deepPurpleAccent),
              title: const Text('Categorías'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.deepPurpleAccent),
              title: const Text('Productos destacados'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.grey),
              title: const Text('Ayuda y soporte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatAssistantScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatAssistantScreen(),
          ),
        );
      },
        backgroundColor: Colors.indigo,
        tooltip: 'Help & Support',
        child: const Icon(Icons.contact_support, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Mostrar snackbar solo cuando se selecciona Cupones
    if (index == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cupones seleccionados'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  },
  selectedItemColor: Colors.indigo,
  unselectedItemColor: Colors.grey,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_play),
      label: 'Cupones',
    ),
  ],
),
      );
  }
}

// Modelo de producto y pantallas

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products =  [
    Product(
      name: 'Ramo Clásico de Rosas',
      description: 'Elegante ramo con 12 rosas rojas frescas, acompañadas de verde ornamental. Perfecto para aniversarios o declaraciones de amor.',
      imageUrl: 'assets/rosas.jpg',
      price: 14.99,
      rating: 4.5,
    ),
    Product(
      name: 'Centro de Mesa Elegante',
      description: 'Exquisito arreglo floral con  rosas blancas y verdes tropicales en base de cerámica artesanal. Ideal para bodas y eventos especiales.',
      imageUrl: 'assets/centro_mesa.jpg',
      price: 59.99,
      rating: 5.0,
    ),
    Product(
      name: 'Loto Sagrado en Maceta',
      description: 'Planta de loto vivo en maceta decorativa. Símbolo de pureza y belleza en la cultura oriental. Incluye instrucciones de cuidado.',
      imageUrl: 'assets/loto.jpg',
      price: 100.00,
      rating: 4.0,
    ),
    Product(
      name: 'Orquídea Azul Real',
      description: 'Rara y hermosa orquídea azul, cultivada con cuidado especial. Flores que duran hasta 8 semanas. Incluye maceta de regalo.',
      imageUrl: 'assets/orquidea.jpg',
      price: 250.00,
      rating: 4.7,
    ),
    Product(
      name: 'Jardín de Suculentas',
      description: 'Colección de 5 suculentas variadas en macetero de madera rústica. Bajo mantenimiento y perfecto para decoración de interiores.',
      imageUrl: 'assets/suculentas.jpg',
      price: 39.99,
      rating: 4.8,
    ),
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8, // 80% del ancho
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar flores...',
                prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.indigo,
                    width: 2.0, // Grosor del borde aumentado
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 70,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('Rosas', Icons.local_florist),
                _buildFilterChip('Temporada', Icons.calendar_today),
                _buildFilterChip('Ofertas', Icons.discount),
              ],
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lo más vendido',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[800],
                ),
              ),
            ],
          ),
        ),
          
          // Lista de productos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Hero(
                tag: 'product-image-${product.name}',
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Información del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Widget de estrellas para la valoración
                    Row(
                      children: [
                        _buildRatingStars(product.rating),
                        const SizedBox(width: 8),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir las estrellas de valoración
  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 20);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 20);
        }
      }),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        product.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.indigo),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto con sombra
          Hero(
            tag: 'product-image-${product.name}',
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Nombre y rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  _buildRatingStars(product.rating),
                  const SizedBox(width: 8),
                  Text(
                    product.rating.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Precio
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 24),

          // Descripción
          const Text(
            'Descripción:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),

          // Botón de añadir al carrito
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart, size: 24),
              label: const Text(
                'AÑADIR AL CARRITO',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} añadido al carrito'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 24);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 24);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 24);
        }
      }),
    );
  }
}

// Páginas para cada sección

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 60, color: Colors.indigo),
          const SizedBox(height: 20),
          const Text(
            'Buscar productos',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe lo que buscas...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/1.jpg'),
          ),
          const SizedBox(height: 20),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.indigo),
            title: const Text('Historial de compras'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text('Favoritos'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text('Configuración'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.grey),
            title: const Text('Ayuda y soporte'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text('CERRAR SESIÓN'),
            ),
          ),
        ],
      ),
    );
  }
}

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_play, size: 60, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              'Cupones Disponibles',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cupón aplicado')),
                );
              },
              child: const Text('Aplicar Cupón'),
            ),
          ],
        ),
      ),
    );
  }
}


class ChatAssistantScreen extends StatelessWidget {
  const ChatAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistente Virtual'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(
                  text: '¡Hola! Soy tu asistente de Flor de Loto. ¿En qué puedo ayudarte hoy?',
                  isMe: false,
                ),
                // Aquí se agregarán más mensajes dinámicamente
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.indigo,
                  onPressed: () {
                    // Lógica para enviar mensaje
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}

Widget _buildFilterChip(String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: FilterChip(
      label: Text(label),
      avatar: Icon(icon, size: 18),
      selected: false,
      onSelected: (bool value) {
        // Lógica de filtrado
      },
      backgroundColor: Colors.white,
      selectedColor: Colors.indigo[100],
      checkmarkColor: Colors.indigo,
      labelStyle: TextStyle(
        color: Colors.indigo[800],
        fontWeight: FontWeight.w500,
      ),
      shape: StadiumBorder(
        side: BorderSide(color: Colors.indigo),
      ),
    ),
  );
}