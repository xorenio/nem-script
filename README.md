## nem-script

```bash
if [ "$EUID" -ne 0 ]; then 
echo ""
echo -e "${red}Please run as root${NC}"
echo "As this scrit might be used to install"
echo ""
exit
fi
```
