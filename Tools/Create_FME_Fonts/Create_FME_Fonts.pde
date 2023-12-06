import java.awt.Desktop;

int[] fontSizes = {8, 12, 16, 24, 32,};
int[] fontNumbers = {-1};
String fontType = ".ttf";
//String fontType = ".otf";
boolean smooth = true;


static final int[] unicodeBlocks = {
  // The list below has been created from the table here: https://en.wikipedia.org/wiki/Unicode_block
  // Remove // at start of lines below to include that unicode block, different code ranges can also be specified by
  // editing the start and end-of-range values. Multiple lines from the list below can be included, limited only by
  // the final font file size!

  // Block range,   //Block name, Code points, Assigned characters, Scripts
  // First, last,   //Range is inclusive of first and last codes
  //0x0021, 0x007E, //Basic Latin, 128, 128, Latin (52 characters), Common (76 characters)
  //0x0080, 0x00FF, //Latin-1 Supplement, 128, 128, Latin (64 characters), Common (64 characters)
  //0x00A1, 0x00FF, //Latin-1 Supplement, 128, 128, Latin (64 characters), Common (64 characters)
  //0x0100, 0x017F, //Latin Extended-A, 128, 128, Latin
  //0x0180, 0x024F, //Latin Extended-B, 208, 208, Latin
  //0x0250, 0x02AF, //IPA Extensions, 96, 96, Latin
  //0x02B0, 0x02FF, //Spacing Modifier Letters, 80, 80, Bopomofo (2 characters), Latin (14 characters), Common (64 characters)
  //0x0300, 0x036F, //Combining Diacritical Marks, 112, 112, Inherited
  //0x0370, 0x03FF, //Greek and Coptic, 144, 135, Coptic (14 characters), Greek (117 characters), Common (4 characters)
  //0x0400, 0x04FF, //Cyrillic, 256, 256, Cyrillic (254 characters), Inherited (2 characters)
  //0x0500, 0x052F, //Cyrillic Supplement, 48, 48, Cyrillic
  //0x0530, 0x058F, //Armenian, 96, 89, Armenian (88 characters), Common (1 character)
  //0x0590, 0x05FF, //Hebrew, 112, 87, Hebrew
  //0x0600, 0x06FF, //Arabic, 256, 255, Arabic (237 characters), Common (6 characters), Inherited (12 characters)
  //0x0700, 0x074F, //Syriac, 80, 77, Syriac
  //0x0750, 0x077F, //Arabic Supplement, 48, 48, Arabic
  //0x0780, 0x07BF, //Thaana, 64, 50, Thaana
  //0x07C0, 0x07FF, //NKo, 64, 59, Nko
  //0x0800, 0x083F, //Samaritan, 64, 61, Samaritan
  //0x0840, 0x085F, //Mandaic, 32, 29, Mandaic
  //0x0860, 0x086F, //Syriac Supplement, 16, 11, Syriac
  //0x08A0, 0x08FF, //Arabic Extended-A, 96, 73, Arabic (72 characters), Common (1 character)
  //0x0900, 0x097F, //Devanagari, 128, 128, Devanagari (124 characters), Common (2 characters), Inherited (2 characters)
  //0x0980, 0x09FF, //Bengali, 128, 95, Bengali
  //0x0A00, 0x0A7F, //Gurmukhi, 128, 79, Gurmukhi
  //0x0A80, 0x0AFF, //Gujarati, 128, 91, Gujarati
  //0x0B00, 0x0B7F, //Oriya, 128, 90, Oriya
  //0x0B80, 0x0BFF, //Tamil, 128, 72, Tamil
  //0x0C00, 0x0C7F, //Telugu, 128, 96, Telugu
  //0x0C80, 0x0CFF, //Kannada, 128, 88, Kannada
  //0x0D00, 0x0D7F, //Malayalam, 128, 117, Malayalam
  //0x0D80, 0x0DFF, //Sinhala, 128, 90, Sinhala
  //0x0E00, 0x0E7F, //Thai, 128, 87, Thai (86 characters), Common (1 character)
  //0x0E80, 0x0EFF, //Lao, 128, 67, Lao
  //0x0F00, 0x0FFF, //Tibetan, 256, 211, Tibetan (207 characters), Common (4 characters)
  //0x1000, 0x109F, //Myanmar, 160, 160, Myanmar
  //0x10A0, 0x10FF, //Georgian, 96, 88, Georgian (87 characters), Common (1 character)
  //0x1100, 0x11FF, //Hangul Jamo, 256, 256, Hangul
  //0x1200, 0x137F, //Ethiopic, 384, 358, Ethiopic
  //0x1380, 0x139F, //Ethiopic Supplement, 32, 26, Ethiopic
  //0x13A0, 0x13FF, //Cherokee, 96, 92, Cherokee
  //0x1400, 0x167F, //Unified Canadian Aboriginal Syllabics, 640, 640, Canadian Aboriginal
  //0x1680, 0x169F, //Ogham, 32, 29, Ogham
  //0x16A0, 0x16FF, //Runic, 96, 89, Runic (86 characters), Common (3 characters)
  //0x1700, 0x171F, //Tagalog, 32, 20, Tagalog
  //0x1720, 0x173F, //Hanunoo, 32, 23, Hanunoo (21 characters), Common (2 characters)
  //0x1740, 0x175F, //Buhid, 32, 20, Buhid
  //0x1760, 0x177F, //Tagbanwa, 32, 18, Tagbanwa
  //0x1780, 0x17FF, //Khmer, 128, 114, Khmer
  //0x1800, 0x18AF, //Mongolian, 176, 156, Mongolian (153 characters), Common (3 characters)
  //0x18B0, 0x18FF, //Unified Canadian Aboriginal Syllabics Extended, 80, 70, Canadian Aboriginal
  //0x1900, 0x194F, //Limbu, 80, 68, Limbu
  //0x1950, 0x197F, //Tai Le, 48, 35, Tai Le
  //0x1980, 0x19DF, //New Tai Lue, 96, 83, New Tai Lue
  //0x19E0, 0x19FF, //Khmer Symbols, 32, 32, Khmer
  //0x1A00, 0x1A1F, //Buginese, 32, 30, Buginese
  //0x1A20, 0x1AAF, //Tai Tham, 144, 127, Tai Tham
  //0x1AB0, 0x1AFF, //Combining Diacritical Marks Extended, 80, 15, Inherited
  //0x1B00, 0x1B7F, //Balinese, 128, 121, Balinese
  //0x1B80, 0x1BBF, //Sundanese, 64, 64, Sundanese
  //0x1BC0, 0x1BFF, //Batak, 64, 56, Batak
  //0x1C00, 0x1C4F, //Lepcha, 80, 74, Lepcha
  //0x1C50, 0x1C7F, //Ol Chiki, 48, 48, Ol Chiki
  //0x1C80, 0x1C8F, //Cyrillic Extended-C, 16, 9, Cyrillic
  //0x1CC0, 0x1CCF, //Sundanese Supplement, 16, 8, Sundanese
  //0x1CD0, 0x1CFF, //Vedic Extensions, 48, 42, Common (15 characters), Inherited (27 characters)
  //0x1D00, 0x1D7F, //Phonetic Extensions, 128, 128, Cyrillic (2 characters), Greek (15 characters), Latin (111 characters)
  //0x1D80, 0x1DBF, //Phonetic Extensions Supplement, 64, 64, Greek (1 character), Latin (63 characters)
  //0x1DC0, 0x1DFF, //Combining Diacritical Marks Supplement, 64, 63, Inherited
  //0x1E00, 0x1EFF, //Latin Extended Additional, 256, 256, Latin
  //0x1F00, 0x1FFF, //Greek Extended, 256, 233, Greek
  //0x2000, 0x206F, //General Punctuation, 112, 111, Common (109 characters), Inherited (2 characters)
  //0x2070, 0x209F, //Superscripts and Subscripts, 48, 42, Latin (15 characters), Common (27 characters)
  //0x20A0, 0x20CF, //Currency Symbols, 48, 32, Common
  //0x20D0, 0x20FF, //Combining Diacritical Marks for Symbols, 48, 33, Inherited
  //0x2100, 0x214F, //Letterlike Symbols, 80, 80, Greek (1 character), Latin (4 characters), Common (75 characters)
  //0x2150, 0x218F, //Number Forms, 64, 60, Latin (41 characters), Common (19 characters)
  //0x2190, 0x21FF, //Arrows, 112, 112, Common
  //0x2200, 0x22FF, //Mathematical Operators, 256, 256, Common
  //0x2300, 0x23FF, //Miscellaneous Technical, 256, 256, Common
  //0x2400, 0x243F, //Control Pictures, 64, 39, Common
  //0x2440, 0x245F, //Optical Character Recognition, 32, 11, Common
  //0x2460, 0x24FF, //Enclosed Alphanumerics, 160, 160, Common
  //0x2500, 0x257F, //Box Drawing, 128, 128, Common
  //0x2580, 0x259F, //Block Elements, 32, 32, Common
  //0x25A0, 0x25FF, //Geometric Shapes, 96, 96, Common
  //0x2600, 0x26FF, //Miscellaneous Symbols, 256, 256, Common
  //0x2700, 0x27BF, //Dingbats, 192, 192, Common
  //0x27C0, 0x27EF, //Miscellaneous Mathematical Symbols-A, 48, 48, Common
  //0x27F0, 0x27FF, //Supplemental Arrows-A, 16, 16, Common
  //0x2800, 0x28FF, //Braille Patterns, 256, 256, Braille
  //0x2900, 0x297F, //Supplemental Arrows-B, 128, 128, Common
  //0x2980, 0x29FF, //Miscellaneous Mathematical Symbols-B, 128, 128, Common
  //0x2A00, 0x2AFF, //Supplemental Mathematical Operators, 256, 256, Common
  //0x2B00, 0x2BFF, //Miscellaneous Symbols and Arrows, 256, 207, Common
  //0x2C00, 0x2C5F, //Glagolitic, 96, 94, Glagolitic
  //0x2C60, 0x2C7F, //Latin Extended-C, 32, 32, Latin
  //0x2C80, 0x2CFF, //Coptic, 128, 123, Coptic
  //0x2D00, 0x2D2F, //Georgian Supplement, 48, 40, Georgian
  //0x2D30, 0x2D7F, //Tifinagh, 80, 59, Tifinagh
  //0x2D80, 0x2DDF, //Ethiopic Extended, 96, 79, Ethiopic
  //0x2DE0, 0x2DFF, //Cyrillic Extended-A, 32, 32, Cyrillic
  //0x2E00, 0x2E7F, //Supplemental Punctuation, 128, 74, Common
  //0x2E80, 0x2EFF, //CJK Radicals Supplement, 128, 115, Han
  //0x2F00, 0x2FDF, //Kangxi Radicals, 224, 214, Han
  //0x2FF0, 0x2FFF, //Ideographic Description Characters, 16, 12, Common
  //0x3000, 0x303F, //CJK Symbols and Punctuation, 64, 64, Han (15 characters), Hangul (2 characters), Common (43 characters), Inherited (4 characters)
  //0x3040, 0x309F, //Hiragana, 96, 93, Hiragana (89 characters), Common (2 characters), Inherited (2 characters)
  //0x30A0, 0x30FF, //Katakana, 96, 96, Katakana (93 characters), Common (3 characters)
  //0x3100, 0x312F, //Bopomofo, 48, 42, Bopomofo
  //0x3130, 0x318F, //Hangul Compatibility Jamo, 96, 94, Hangul
  //0x3190, 0x319F, //Kanbun, 16, 16, Common
  //0x31A0, 0x31BF, //Bopomofo Extended, 32, 27, Bopomofo
  //0x31C0, 0x31EF, //CJK Strokes, 48, 36, Common
  //0x31F0, 0x31FF, //Katakana Phonetic Extensions, 16, 16, Katakana
  //0x3200, 0x32FF, //Enclosed CJK Letters and Months, 256, 254, Hangul (62 characters), Katakana (47 characters), Common (145 characters)
  //0x3300, 0x33FF, //CJK Compatibility, 256, 256, Katakana (88 characters), Common (168 characters)
  //0x3400, 0x4DBF, //CJK Unified Ideographs Extension A, 6,592, 6,582, Han
  //0x4DC0, 0x4DFF, //Yijing Hexagram Symbols, 64, 64, Common
  //0x4E00, 0x9FFF, //CJK Unified Ideographs, 20,992, 20,971, Han
  //0xA000, 0xA48F, //Yi Syllables, 1,168, 1,165, Yi
  //0xA490, 0xA4CF, //Yi Radicals, 64, 55, Yi
  //0xA4D0, 0xA4FF, //Lisu, 48, 48, Lisu
  //0xA500, 0xA63F, //Vai, 320, 300, Vai
  //0xA640, 0xA69F, //Cyrillic Extended-B, 96, 96, Cyrillic
  //0xA6A0, 0xA6FF, //Bamum, 96, 88, Bamum
  //0xA700, 0xA71F, //Modifier Tone Letters, 32, 32, Common
  //0xA720, 0xA7FF, //Latin Extended-D, 224, 160, Latin (155 characters), Common (5 characters)
  //0xA800, 0xA82F, //Syloti Nagri, 48, 44, Syloti Nagri
  //0xA830, 0xA83F, //Common Indic Number Forms, 16, 10, Common
  //0xA840, 0xA87F, //Phags-pa, 64, 56, Phags Pa
  //0xA880, 0xA8DF, //Saurashtra, 96, 82, Saurashtra
  //0xA8E0, 0xA8FF, //Devanagari Extended, 32, 30, Devanagari
  //0xA900, 0xA92F, //Kayah Li, 48, 48, Kayah Li (47 characters), Common (1 character)
  //0xA930, 0xA95F, //Rejang, 48, 37, Rejang
  //0xA960, 0xA97F, //Hangul Jamo Extended-A, 32, 29, Hangul
  //0xA980, 0xA9DF, //Javanese, 96, 91, Javanese (90 characters), Common (1 character)
  //0xA9E0, 0xA9FF, //Myanmar Extended-B, 32, 31, Myanmar
  //0xAA00, 0xAA5F, //Cham, 96, 83, Cham
  //0xAA60, 0xAA7F, //Myanmar Extended-A, 32, 32, Myanmar
  //0xAA80, 0xAADF, //Tai Viet, 96, 72, Tai Viet
  //0xAAE0, 0xAAFF, //Meetei Mayek Extensions, 32, 23, Meetei Mayek
  //0xAB00, 0xAB2F, //Ethiopic Extended-A, 48, 32, Ethiopic
  //0xAB30, 0xAB6F, //Latin Extended-E, 64, 54, Latin (52 characters), Greek (1 character), Common (1 character)
  //0xAB70, 0xABBF, //Cherokee Supplement, 80, 80, Cherokee
  //0xABC0, 0xABFF, //Meetei Mayek, 64, 56, Meetei Mayek
  //0xAC00, 0xD7AF, //Hangul Syllables, 11,184, 11,172, Hangul
  //0xD7B0, 0xD7FF, //Hangul Jamo Extended-B, 80, 72, Hangul
  //0xD800, 0xDB7F, //High Surrogates, 896, 0, Unknown
  //0xDB80, 0xDBFF, //High Private Use Surrogates, 128, 0, Unknown
  //0xDC00, 0xDFFF, //Low Surrogates, 1,024, 0, Unknown
  //0xE000, 0xF8FF, //Private Use Area, 6,400, 6,400, Unknown
  //0xF900, 0xFAFF, //CJK Compatibility Ideographs, 512, 472, Han
  //0xFB00, 0xFB4F, //Alphabetic Presentation Forms, 80, 58, Armenian (5 characters), Hebrew (46 characters), Latin (7 characters)
  //0xFB50, 0xFDFF, //Arabic Presentation Forms-A, 688, 611, Arabic (609 characters), Common (2 characters)
  //0xFE00, 0xFE0F, //Variation Selectors, 16, 16, Inherited
  //0xFE10, 0xFE1F, //Vertical Forms, 16, 10, Common
  //0xFE20, 0xFE2F, //Combining Half Marks, 16, 16, Cyrillic (2 characters), Inherited (14 characters)
  //0xFE30, 0xFE4F, //CJK Compatibility Forms, 32, 32, Common
  //0xFE50, 0xFE6F, //Small Form Variants, 32, 26, Common
  //0xFE70, 0xFEFF, //Arabic Presentation Forms-B, 144, 141, Arabic (140 characters), Common (1 character)
  //0xFF00, 0xFFEF, //Halfwidth and Fullwidth Forms, 240, 225, Hangul (52 characters), Katakana (55 characters), Latin (52 characters), Common (66 characters)
  //0xFFF0, 0xFFFF, //Specials, 16, 5, Common

  //0x0030, 0x0039, //Example custom range (numbers 0-9)
  //0x0041, 0x005A, //Example custom range (Upper case A-Z)
  //0x0061, 0x007A, //Example custom range (Lower case a-z)
  
  0x0021, 0xFFFF, //All
};

// Here we specify particular individual Unicodes to be included (appended at end of selected range)
static final int[] specificUnicodes = {

  //German Unicodes
  //0x00DF, 0x00E4, 0x00F6, 0x00FC, 0x00C4, 0x00D6, 0x00DC,
  
  
  
  
  // Commonly used codes, add or remove // in next line
  // 0x00A3, 0x00B0, 0x00B5, 0x03A9, 0x20AC, // £ ° µ Ω €

  // Numbers and characters for showing time, change next line to //* to use
/*
    0x002B, 0x002D, 0x002E, 0x0030, 0x0031, 0x0032, 0x0033, 0x0034, // - + . 0 1 2 3 4
    0x0035, 0x0036, 0x0037, 0x0038, 0x0039, 0x003A, 0x0061, 0x006D, // 5 6 7 8 9 : a m
    0x0070,                                                         // p
 //*/

  // More characters for TFT_eSPI test sketches, change next line to //* to use
  /*
    0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x010C, 0x010D,
    0x010E, 0x010F, 0x0110, 0x0111, 0x0118, 0x0119, 0x011A, 0x011B,
 
    0x0131, 0x0139, 0x013A, 0x013D, 0x013E, 0x0141, 0x0142, 0x0143,
    0x0144, 0x0147, 0x0148, 0x0150, 0x0151, 0x0152, 0x0153, 0x0154,
    0x0155, 0x0158, 0x0159, 0x015A, 0x015B, 0x015E, 0x015F, 0x0160,
    0x0161, 0x0162, 0x0163, 0x0164, 0x0165, 0x016E, 0x016F, 0x0170,
    0x0171, 0x0178, 0x0179, 0x017A, 0x017B, 0x017C, 0x017D, 0x017E,
    0x0192,
 
    0x02C6, 0x02C7, 0x02D8, 0x02D9, 0x02DA, 0x02DB, 0x02DC, 0x02DD,
    0x03A9, 0x03C0, 0x2013, 0x2014, 0x2018, 0x2019, 0x201A, 0x201C,
    0x201D, 0x201E, 0x2020, 0x2021, 0x2022, 0x2026, 0x2030, 0x2039,
    0x203A, 0x2044, 0x20AC,
 
    0x2122, 0x2202, 0x2206, 0x220F,
 
    0x2211, 0x221A, 0x221E, 0x222B, 0x2248, 0x2260, 0x2264, 0x2265,
    0x25CA,
 
    0xF8FF, 0xFB01, 0xFB02,
  //*/
};

int firstUnicode = 0;
int lastUnicode  = 0;

PrintWriter logOutput;

void setup() {
  
  size(1000, 800);
   
  logOutput = createWriter("FontFiles/System_Font_List.txt"); 
  String[] fontList = PFont.list();
  //printArray(fontList);

  // Save font list to file
  for (int x = 0; x < fontList.length; x++)
  {
    logOutput.print("[" + x + "] ");
    logOutput.println(fontList[x]);
  }
  logOutput.flush(); // Writes the remaining data to the file
  logOutput.close();
  
  char[]   charset;
  int  index = 0, count = 0;

  int blockCount = unicodeBlocks.length;

  for (int i = 0; i < blockCount; i+=2)
  {
    firstUnicode = unicodeBlocks[i];
    lastUnicode  = unicodeBlocks[i+1];
    if (lastUnicode < firstUnicode)
    {
      delay(100);
      System.err.println("ERROR: Bad Unicode range secified, last < first!");
      System.err.print("first in range = 0x" + hex(firstUnicode, 4));
      System.err.println(", last in range  = 0x" + hex(lastUnicode, 4));
      while (true);
    }
    // calculate the number of characters
    count += (lastUnicode - firstUnicode + 1);
  }

  count += specificUnicodes.length;
  
  println();
  println("=====================");
  println("Creating font files...");
  println("Unicode blocks included     = " + (blockCount/2));
  println("Specific unicodes included  = " + specificUnicodes.length);
  println("Total number of characters  = " + count);

  if (count == 0)
  {
    delay(100);
    System.err.println("ERROR: No Unicode range or specific codes have been defined!");
    exit();
  }

  // allocate memory
  charset = new char[count];

  for (int i = 0; i < blockCount; i+=2)
  {
    firstUnicode = unicodeBlocks[i];
    lastUnicode  =  unicodeBlocks[i+1];

    // loading the range specified
    for (int code = firstUnicode; code <= lastUnicode; code++)
    {
      charset[index] = Character.toChars(code)[0];
      index++;
    }
  }

  // loading the specific point codes
  for (int i = 0; i < specificUnicodes.length; i++)
  {
    charset[index] = Character.toChars(specificUnicodes[i])[0];
    index++;
  }
  
  //Now print
  for (int x = 0; x < fontList.length; x++)
  //for (int x = 450; x < 451; x++)
  {
    PrintWriter output = createWriter("FontFiles/" + fontList[x] + "/CharSize.csv");
    
    output.print("Char");
    for (int y = 0; y < fontSizes.length; y++)
    {
      output.print(";" + fontSizes[y]);
    }
    output.println("");
   
    index = 0;
    while (true)
    {
      int unicode = charset[index];
      output.print(new String(Character.toChars(unicode)));
      for (int y = 0; y < fontSizes.length; y++)
      {
        textSize(fontSizes[y]);
        float cwidth = textWidth((char)unicode) + 2;
        output.print(";" + cwidth);
      }
      output.println("");
      index++;
      if (index >= count)
      {
        break;
      }
    }
    output.flush();
    output.close();
    
    for (int y = 0; y < fontSizes.length; y++)
    {
      PFont font = createFont(fontList[x], fontSizes[y], smooth, charset);
      OutputStream outputFont = createOutput("FontFiles/" + fontList[x] + "/" + fontList[x] + str(fontSizes[y]) + ".vlw");
      try
      {
        font.save(outputFont);
        outputFont.close();
      }
      catch(IOException e)
      {
      }
    }
  }
  exit();
}
