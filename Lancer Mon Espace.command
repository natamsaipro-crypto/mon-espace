#!/bin/zsh
# Double-clique ce fichier pour démarrer Mon Espace sur ton Mac.
cd "$(dirname "$0")"
PORT=8790
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
echo ""
echo "  Mon Espace est lancé ✅"
echo ""
echo "  Sur ce Mac  : http://localhost:$PORT"
[ -n "$IP" ] && echo "  Sur iPhone  : http://$IP:$PORT  (même Wi-Fi, ouvrir dans Safari)"
echo ""
echo "  Laisse cette fenêtre ouverte. Ferme-la pour arrêter."
echo ""
(sleep 1; open "http://localhost:$PORT") &
exec python3 -m http.server $PORT --bind 0.0.0.0 >/dev/null 2>&1
