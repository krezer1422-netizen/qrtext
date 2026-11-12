#!/data/data/com.termux/files/usr/bin/bash

REPO="https://raw.githubusercontent.com/krezer1422-netizen/qrtext/main"

echo "QRText v1.0.3 o'rnatilsinmi? [Y/n]"
read -r answer < /dev/tty || exit 1

case "$answer" in
    n|N|no|NO)
        echo "O'rnatish bekor qilindi."
        exit 0
        ;;
esac

pkg install python -y || exit 1
python -m pip install qrcode || exit 1

curl -fsSL "$REPO/qrtext" -o "$PREFIX/bin/qrtext" || exit 1

chmod +x "$PREFIX/bin/qrtext"

echo "QRText muvaffaqiyatli o'rnatildi!"
