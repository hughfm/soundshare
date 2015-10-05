# SoundShare

__[SoundShare](//sound-share.herokuapp.com)__ is a Rails application primarily for exploring the uploading, playing and sharing of audio files.

### Brief / Functionality
Users must sign up for an account before they can upload audio files.

When uploading a file, it can be set as public, enabling anyone to enjoy that file. If not set to public, the sound will only be available to the owner, and any users that the owner explicitly chooses to share with.

### Tools & Technologies
The application was built with __Ruby__ (2.2.2), __Rails__ (4.2.3) and a __PostgreSQL__ database.

The interface uses __Bootstrap__ and the __Flat UI__ theme.

File attachments and uploads were handled using the __[Refile](https://github.com/refile/refile)__ gem, and __AWS S3__. When retrieving files, __AWS Cloudfront__ is configured to optimise performance.

The playback of audio files and rendering of waveforms was implemented with the __[Wavesurfer.js](http://wavesurfer-js.org/)__ javascript library.

### Notes and Challenges

There were many challenges associated with streamlining the upload page. I have integrated the Refile uploader with Wavefurfer, so the following happens when an audio file is chosen, or dragged into the drop area:
- presigned upload begins direct to S3, with progress displayed underneath the drop area
- audio file is loaded locally, and can be previewed with Wavesurfer as the upload is taking place
- file can be saved to the database once the upload is complete

The HTML file input was _particularly_ challenging to style!

Comments/questions are welcome, email [Hugh Middleton](mailto:hughfmiddleton@gmail.com) (hughfmiddleton@gmail.com).
