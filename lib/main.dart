import 'package:flutter/material.dart';

void main() => runApp(const SainsCeriaApp());

// ---------- Warna & gaya ----------
const ink = Color(0xFF2B2A4C);
const sky = Color(0xFFDDF1FF);
const sun = Color(0xFFFFD23F);

TextStyle ts(double size, [FontWeight w = FontWeight.w700, Color c = ink]) =>
    TextStyle(fontSize: size, fontWeight: w, color: c, height: 1.25);

// Kad gaya "pelekat": garis tebal + bayang keras
class Sticker extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  const Sticker({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.radius = 24,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [BoxShadow(color: ink, offset: Offset(4, 5))],
        ),
        child: Material(
          color: color,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: const BorderSide(color: ink, width: 3),
          ),
          child: InkWell(onTap: onTap, child: Padding(padding: padding, child: child)),
        ),
      );
}

Widget bubble(String emoji, double size, Color bg) => Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: ink, width: 3),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Text(emoji, style: TextStyle(fontSize: size * 0.5)),
      ),
    );

// ---------- Data ----------
class Item {
  final String emoji, title, desc;
  const Item(this.emoji, this.title, this.desc);
}

class Quiz {
  final String q;
  final List<String> options;
  final int answer;
  const Quiz(this.q, this.options, this.answer);
}

class Chapter {
  final String title, emoji;
  final Color color, soft;
  final List<Item> items;
  final List<Quiz> quiz;
  const Chapter(this.title, this.emoji, this.color, this.soft, this.items, this.quiz);
}

const chapters = <Chapter>[
  Chapter('Binatang', '🦁', Color(0xFFFF9F43), Color(0xFFFFE3C2), [
    Item('🐱', 'Kucing', 'Kucing ialah mamalia. Ia melahirkan anak dan menyusukan anaknya.'),
    Item('🐟', 'Ikan', 'Ikan hidup di dalam air dan bernafas menggunakan insang.'),
    Item('🐦', 'Burung', 'Burung mempunyai bulu dan sayap. Burung bertelur.'),
    Item('🐸', 'Katak', 'Katak boleh hidup di darat dan di dalam air.'),
    Item('🐍', 'Ular', 'Ular ialah reptilia. Ia bergerak dengan cara melata.'),
  ], [
    Quiz('Ikan bernafas menggunakan apa?', ['Insang', 'Paru-paru', 'Sayap'], 0),
    Quiz('Binatang manakah yang mempunyai bulu dan bertelur?', ['Kucing', 'Burung', 'Ikan'], 1),
    Quiz('Binatang manakah menyusukan anaknya?', ['Ular', 'Katak', 'Kucing'], 2),
  ]),
  Chapter('Tumbuhan', '🌳', Color(0xFF3DD598), Color(0xFFCFF5E3), [
    Item('🌱', 'Akar', 'Akar menyerap air dan garam mineral dari tanah.'),
    Item('🪵', 'Batang', 'Batang menyokong tumbuhan dan mengangkut air ke daun.'),
    Item('🍃', 'Daun', 'Daun membuat makanan untuk tumbuhan menggunakan cahaya matahari.'),
    Item('🌸', 'Bunga', 'Bunga akan berubah menjadi buah.'),
    Item('🍎', 'Buah', 'Buah mengandungi biji benih untuk tumbuh menjadi pokok baharu.'),
  ], [
    Quiz('Bahagian manakah menyerap air dari tanah?', ['Daun', 'Akar', 'Bunga'], 1),
    Quiz('Daun membuat makanan menggunakan apa?', ['Cahaya matahari', 'Angin', 'Bunyi'], 0),
    Quiz('Buah mengandungi apa?', ['Akar', 'Batu', 'Biji benih'], 2),
  ]),
  Chapter('Organ Badan', '🧠', Color(0xFFFF6B9D), Color(0xFFFFD6E5), [
    Item('❤️', 'Jantung', 'Jantung mengepam darah ke seluruh badan.'),
    Item('🫁', 'Paru-paru', 'Paru-paru membantu kita bernafas.'),
    Item('🧠', 'Otak', 'Otak membantu kita berfikir dan mengawal badan.'),
    Item('🍽️', 'Perut', 'Perut mencerna makanan yang kita makan.'),
    Item('👁️', 'Mata', 'Mata membolehkan kita melihat.'),
  ], [
    Quiz('Organ manakah mengepam darah?', ['Jantung', 'Perut', 'Mata'], 0),
    Quiz('Kita bernafas menggunakan?', ['Otak', 'Paru-paru', 'Jantung'], 1),
    Quiz('Organ manakah membantu kita berfikir?', ['Perut', 'Paru-paru', 'Otak'], 2),
  ]),
  Chapter('Tenaga', '⚡', Color(0xFF4D96FF), Color(0xFFCDE2FF), [
    Item('☀️', 'Matahari', 'Matahari ialah sumber tenaga utama di Bumi.'),
    Item('💡', 'Cahaya', 'Cahaya membolehkan kita melihat benda di sekeliling.'),
    Item('🔥', 'Haba', 'Haba membuat benda menjadi panas, contohnya api.'),
    Item('🔊', 'Bunyi', 'Bunyi terhasil apabila sesuatu bergetar.'),
    Item('🔌', 'Elektrik', 'Elektrik menyalakan lampu dan menggerakkan kipas.'),
  ], [
    Quiz('Apakah sumber tenaga utama di Bumi?', ['Bulan', 'Matahari', 'Bintang'], 1),
    Quiz('Bunyi terhasil apabila sesuatu...', ['Bergetar', 'Sejuk', 'Diam'], 0),
    Quiz('Tenaga apa yang menyalakan lampu?', ['Haba', 'Bunyi', 'Elektrik'], 2),
  ]),
];

// ---------- App ----------
class SainsCeriaApp extends StatelessWidget {
  const SainsCeriaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sains Ceria',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.indigo,
          scaffoldBackgroundColor: sky,
        ),
        home: const HomePage(),
      );
}

// ---------- Laman utama ----------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Sains Ceria', style: ts(36, FontWeight.w900)),
                    const SizedBox(height: 2),
                    Text('Pilih satu bab, jom belajar!', style: ts(16, FontWeight.w600)),
                  ]),
                ),
                bubble('🔬', 64, sun),
              ]),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                itemCount: chapters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 22,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, i) {
                  final ch = chapters[i];
                  // Satu momen sahaja: kad timbul satu demi satu
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 450 + i * 120),
                    curve: Curves.easeOutBack,
                    builder: (_, v, child) => Transform.scale(scale: v, child: child),
                    child: Sticker(
                      color: ch.color,
                      radius: 28,
                      padding: const EdgeInsets.all(14),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ChapterPage(ch, i + 1)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Hero(tag: 'bab$i', child: bubble(ch.emoji, 64, Colors.white)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ink, width: 2),
                          ),
                          child: Text('Bab ${i + 1}', style: ts(12, FontWeight.w800)),
                        ),
                        const SizedBox(height: 6),
                        Row(children: [
                          Expanded(child: Text(ch.title, style: ts(22, FontWeight.w900))),
                          const Icon(Icons.arrow_forward_rounded, color: ink),
                        ]),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      );
}

// ---------- Laman bab ----------
class ChapterPage extends StatelessWidget {
  final Chapter ch;
  final int no;
  const ChapterPage(this.ch, this.no, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ch.color,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
              boxShadow: const [BoxShadow(color: ink, offset: Offset(0, 5))],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 26),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Sticker(
                    radius: 16,
                    padding: const EdgeInsets.all(8),
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_rounded, color: ink),
                  ),
                  const SizedBox(height: 18),
                  Row(children: [
                    Hero(tag: 'bab${no - 1}', child: bubble(ch.emoji, 88, Colors.white)),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Bab $no', style: ts(15, FontWeight.w800)),
                        Text(ch.title, style: ts(32, FontWeight.w900)),
                      ]),
                    ),
                  ]),
                ]),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
              children: [
                for (final it in ch.items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Sticker(
                      radius: 22,
                      child: Row(children: [
                        bubble(it.emoji, 64, ch.soft),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(it.title, style: ts(20, FontWeight.w900)),
                            const SizedBox(height: 4),
                            Text(it.desc, style: ts(15, FontWeight.w600, const Color(0xFF4A4A6A))),
                          ]),
                        ),
                      ]),
                    ),
                  ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
              child: Sticker(
                color: sun,
                radius: 22,
                padding: const EdgeInsets.symmetric(vertical: 16),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizPage(ch)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.play_arrow_rounded, color: ink, size: 30),
                  const SizedBox(width: 6),
                  Text('Mula kuiz', style: ts(21, FontWeight.w900)),
                ]),
              ),
            ),
          ),
        ]),
      );
}

// ---------- Kuiz ----------
class QuizPage extends StatefulWidget {
  final Chapter ch;
  const QuizPage(this.ch, {super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int idx = 0, score = 0;
  int? picked;

  void pick(int i) {
    if (picked != null) return;
    setState(() {
      picked = i;
      if (i == widget.ch.quiz[idx].answer) score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.ch.quiz.length;
    final done = idx >= total;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
          child: done ? _result(total) : _question(total),
        ),
      ),
    );
  }

  Widget _topBar(int total) {
    final value = (idx + (picked != null ? 1 : 0)) / total;
    return Row(children: [
      Sticker(
        radius: 16,
        padding: const EdgeInsets.all(8),
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.close_rounded, color: ink),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Container(
          height: 18,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ink, width: 3),
          ),
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: value),
            duration: const Duration(milliseconds: 400),
            builder: (_, v, __) => FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: v,
              child: Container(color: widget.ch.color),
            ),
          ),
        ),
      ),
      const SizedBox(width: 16),
      Text('${idx + 1}/$total', style: ts(16, FontWeight.w900)),
    ]);
  }

  Widget _question(int total) {
    final ch = widget.ch;
    final q = ch.quiz[idx];
    return ListView(children: [
      _topBar(total),
      const SizedBox(height: 28),
      Sticker(
        radius: 28,
        padding: const EdgeInsets.all(22),
        child: Column(children: [
          Text(ch.emoji, style: const TextStyle(fontSize: 48)),
          const SizedBox(height: 10),
          Text(q.q, textAlign: TextAlign.center, style: ts(24, FontWeight.w900)),
        ]),
      ),
      const SizedBox(height: 28),
      for (var i = 0; i < q.options.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Sticker(
            radius: 20,
            color: picked == null
                ? Colors.white
                : i == q.answer
                    ? const Color(0xFF7EE0A1)
                    : i == picked
                        ? const Color(0xFFFF8F8F)
                        : Colors.white,
            onTap: picked == null ? () => pick(i) : null,
            child: Row(children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ch.soft,
                  shape: BoxShape.circle,
                  border: Border.all(color: ink, width: 2),
                ),
                child: Text('ABC'[i], style: ts(18, FontWeight.w900)),
              ),
              const SizedBox(width: 14),
              Expanded(child: Text(q.options[i], style: ts(19, FontWeight.w800))),
              if (picked != null && i == q.answer)
                const Icon(Icons.check_circle_rounded, color: ink)
              else if (picked == i)
                const Icon(Icons.cancel_rounded, color: ink),
            ]),
          ),
        ),
      if (picked != null) ...[
        const SizedBox(height: 4),
        Text(
          picked == q.answer
              ? '🎉 Betul! Pandai!'
              : '😅 Hampir! Jawapan: ${q.options[q.answer]}',
          textAlign: TextAlign.center,
          style: ts(21, FontWeight.w900),
        ),
        const SizedBox(height: 16),
        Sticker(
          color: sun,
          radius: 22,
          padding: const EdgeInsets.symmetric(vertical: 14),
          onTap: () => setState(() {
            idx++;
            picked = null;
          }),
          child: Center(
            child: Text(
              idx == total - 1 ? 'Lihat markah' : 'Soalan seterusnya',
              style: ts(20, FontWeight.w900),
            ),
          ),
        ),
      ],
    ]);
  }

  Widget _result(int total) {
    final ch = widget.ch;
    final msg = score == total
        ? 'Hebat! Semua betul!'
        : score >= total - 1
            ? 'Bagus! Hampir sempurna.'
            : 'Jangan risau, cuba lagi ya!';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            curve: Curves.elasticOut,
            builder: (_, v, child) => Transform.scale(scale: v, child: child),
            child: bubble(score == total ? '🏆' : '⭐', 150, ch.color),
          ),
        ),
        const SizedBox(height: 24),
        Text('Markah kamu', textAlign: TextAlign.center, style: ts(18, FontWeight.w700)),
        Text('$score / $total', textAlign: TextAlign.center, style: ts(52, FontWeight.w900)),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var i = 0; i < total; i++)
            Icon(Icons.star_rounded,
                size: 46, color: i < score ? sun : const Color(0xFFB8C4D6)),
        ]),
        const SizedBox(height: 12),
        Text(msg, textAlign: TextAlign.center, style: ts(20, FontWeight.w800)),
        const SizedBox(height: 32),
        Sticker(
          color: sun,
          radius: 22,
          padding: const EdgeInsets.symmetric(vertical: 14),
          onTap: () => setState(() {
            idx = 0;
            score = 0;
            picked = null;
          }),
          child: Center(child: Text('Main semula', style: ts(20, FontWeight.w900))),
        ),
        const SizedBox(height: 18),
        Sticker(
          radius: 22,
          padding: const EdgeInsets.symmetric(vertical: 14),
          onTap: () => Navigator.pop(context),
          child: Center(child: Text('Kembali ke bab', style: ts(20, FontWeight.w900))),
        ),
      ],
    );
  }
}