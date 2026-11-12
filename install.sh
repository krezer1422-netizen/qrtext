#!/data/data/com.termux/files/usr/bin/bash

VERSION="1.0.3"
REPO="https://raw.githubusercontent.com/krezer1422-netizen/qrtext/main"
TARGET="$PREFIX/bin/qrtext"

# Termux tekshiruvi
if [ -z "$PREFIX" ]; then
    echo "Xatolik: Faqat Termux qo'llab-quvvatlanadi."
    exit 1
fi

# Interaktiv terminal tekshiruvi
if [ ! -t 0 ]; then
    if [ ! -r /dev/tty ]; then
        echo "Xatolik: Terminal bilan bog'lanib bo'lmadi."
        exit 1
    fi
    exec < /dev/tty
fi

# Foydalanuvchi tasdig'i
echo "QRText v$VERSION o'rnatilsinmi? [Y/n]"
read -r answer || exit 1

case "$answer" in
    Y|y|YES|yes)
        ;;
    n|N|NO|no)
        echo "O'rnatish bekor qilindi."
        exit 0
        ;;
    *)
        echo "O'rnatish bekor qilindi."
        exit 0
        ;;
esac

# Python o'rnatish
pkg install python -y || exit 1

# QR kutubxonasini o'rnatish
python -m pip install qrcode || exit 1

# QRText dasturini yuklash
mkdir -p "$PREFIX/bin" || exit 1

curl -fsSL "$REPO/qrtext" -o "$TARGET" || {
    rm -f "$TARGET"
    echo "Xatolik: QRText yuklanmadi."
    exit 1
}

chmod +x "$TARGET"

echo "QRText v$VERSION muvaffaqiyatli o'rnatildi!"
