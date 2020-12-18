const createPreview = () => {
  const previewSpace = document.getElementById("preview-space");
  document.getElementById("book_image").addEventListener("change",(e) => {
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.querySelector('img');
    if (imageContent) {
      imageContent.remove();
    }
    // 発火したイベントeの中のtargetの中のfilesという配列に格納されている画像を取得
    const file = e.target.files[0];
    // 取得した画像情報のURLを生成する
    const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');
    // 表示する画像を生成
    const blobImage = document.createElement('img');
    // 生成したimg要素のsrc属性に画像情報を設定
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class', 'preview-image');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    previewSpace.appendChild(imageElement);
  })

}
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded',createPreview)
};