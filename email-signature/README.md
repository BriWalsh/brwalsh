# Email signature photo

The broken circle in the signature was a linked image whose host stopped serving it publicly (typical for Google Drive “share” links).

## Fix

1. Open [signature.html](./signature.html) and confirm the photo loads.
2. In Gmail: **Settings → See all settings → General → Signature**
3. Delete the broken image in the signature editor.
4. Re-insert the photo using this direct URL (must end in `.png` and load when opened in a private/incognito window):

   `https://raw.githubusercontent.com/BriWalsh/brwalsh/main/email-signature/Headshot_Brian_Walsh.png`

   Or copy the whole block from `signature.html`.

5. Save changes at the bottom of the Settings page.

## Do not use

- Google Drive “view” or “share” links (`drive.google.com/file/d/...`)
- `drive.google.com/uc?export=view&id=...` without permanent public access (Google often blocks these in email clients now)

## Source photo

`Headshot_Brian_Walsh.png` is the Liatrio headshot from Drive (`Administration_Badges/Headshots`).
