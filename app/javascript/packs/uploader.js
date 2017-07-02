import "babel-polyfill";
import Upload from 'gcs-browser-upload';

let input = document.getElementById('fileInput');
let pause = document.getElementById('pause');
let unpause = document.getElementById('unpause');
let upload = null;

input.addEventListener('change', async () => {
  const file = input.files[0];
  const res = await fetch("/images/resumable_url?filename="+file.name+"&content_type="+file.type);
  const data = await res.json();

  upload = new Upload({
    id: 'foo',
    url: data.url,
    file: file,
    onChunkUpload: (info) => {
      console.log('Chunk uploaded', info);
    }
  });

  try {
    await upload.start();
    console.log('Upload complete!');
  } catch (e) {
    console.log('Upload failed!', e);
  } finally {
    upload = null;
  }
});

pause.addEventListener('click', () => {
  if (upload) {
    upload.pause();
  }
});

unpause.addEventListener('click', () => {
  if (upload) {
    upload.unpause();
  }
});
