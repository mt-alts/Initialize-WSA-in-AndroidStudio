## Bu kaynak, Windows Subsystem for Android'i Android Studio üzerinden başlatmayı ve adb ile bağlanmayı kolaylaştırmak için hazırlanmıştır.

⚠️ Windows Subsystem for Android'in kurulu olduğundan emin olun. <br>
⚠️ WSA USB Hata Ayıklama'nın etkin olduğundan emin olun.

### Adımlar:

1. Android Studio'yu açın.
2. Android Studio ayarlarını açın.
3. Sol taraftan "Tools" bölümünden "External Tools" sekmesini açın.
4. "+" tuşuna basarak "Create Tool" penceresini açın.
5. Aşağıdaki bilgileri girin:

   - **Name**: WSA Başlat
   - **Group**: External Tools
   - **Program**: powershell.exe
   - **Arguments**:
```powershell
-ExecutionPolicy Bypass -Command
"$wsa = 'WsaClient.exe'; $command = 'adb connect 127.0.0.1:58526';
 if ((Get-Command -Name $wsa -ErrorAction SilentlyContinue)) {
Write-Host 'Please wait initializing Windows Subsystem for Android™...';
 Start-Process -FilePath $wsa -ArgumentList '/launch wsa://com.android.system';
Write-Host 'Waiting for ADB...';
 do { $output = Invoke-Expression -Command $command 2>&1;
 if ($output -match 'cannot connect') {
Write-Host 'Error:'$output; Start-Sleep -Seconds 5; }
} while ($output -match 'cannot connect');
 Write-Host 'adb:'$output; } else {
 Write-Host 'Unable to start Subsystem for Android™. Make sure Subsystem for Android™ is installed.';
 }"
```
5. Devamı
   - **Working directory**: C:\ <br>
6. Bu bilgileri girdikten sonra "OK" düğmesine basın.
7. "Apply" ve ardından "OK" düğmesine basın.
8. Son olarak, projenizin üzerine sağ tıklayın ve "External Tools" seçeneğinde yer alan toplu komutlarınızdan oluşan özel aracınızı çalıştırabilirsiniz.
Bu şekilde, Windows Subsystem for Android'i başlatırken aynı zamanda ADB'yi bağlamış olursunuz.
