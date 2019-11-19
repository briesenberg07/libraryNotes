### 20191118
- Attended Sinopia User Group Meeting
- Email / slack

#### Cataloging > finishing reading
**[Alma Inventory (Creating Holdings, Items, and Portfolios)](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-inventory)**
- What is an "order record"?
- Lots of stuff about releasing records, saving and releasing records--what is "releasing" a record?
**[Alma Overlay](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-overlay)**
- Overlay: Replace individual bibliographic records in Alma with records exported from or updated in OCLC Connexion client
- Explains IZ vs. NZ  
**[Alma Work Orders](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-work-orders)**
- Not sure how I will actually fit into this workflow...
  - Probably just sending things to the marking room after I catalog them?
#### Cataloging > finding OCLC nos review class nos in [ClassWeb](https://classweb.org/Auto/)
- SEE: [OCLC Connexion: Searching WorldCat Quick Reference](https://www.oclc.org/content/dam/support/worldcat/documentation/searching/refcard/searchworldcatquickreference.pdf)
  - This provides more detail on using the "Command Line Search" accessible via F2 in Connexion
- Questions:
    - "Held" column in OCLC search results--means held at WAU?
    - I'm frustrated that I can't (?) open two records side-by-side in Connexion to compare them
##### 1. American Dinosaur Abroad:
  - **OCLC nos**
  - Two records look essentially the same to me:
    - 1046614059
    - 1101430841
  - Reasons why I like these better than the other `eng` record 1102647764:
    - Subject headings are live links
    - They say "Held" in the "Held" column; I think that this means that they are WAU holdings/records and therefore high-quality
  - **ClassWeb**
    - Two `050` fields (both with **4** in the second indicator position)
      - QE862.S3 ǂb N54 2019
        - QE862.S3 = "Saurischia"
        - Following link for LC subject correlation takes me [here](https://classweb.org/min/minaret?app=Corr&mod=Search&iname=l2nh&iterm=QE862.S3&count=75&auto=1&close=1&menu=/Auto/)--I have no idea what I'm looking at really, ALTHOUGH "diplodocus does appear here, albeit as 'Diplodocus--Juvenile literature'"
      - QE718 ǂb .N54 2019
        - QE718 = "Collection and preservation" (with [various options](https://classweb.org/min/minaret?app=Class&mod=Search&table=schedules&table=tables&tid=1&menu=/Auto/&iname=span&iterm=QE718&subtype=&ilabel=Class%20number&time=1574120358658))
    - These all seem to be in the general ballpark
    - Note that I tried to include the Cutter in my ClassWeb search string but this does *not* seem to work
##### 2. Ground Water Development - Issues and Sustainable Solutions:
  - **OCLC nos**
    - 1086553037
    - Because:
      - Three search results, one is a computer-mediated resource and one is in French
  - **ClassWeb**
    - One `050` field, again this is `050 | | 4`
        - TD419-428
        - This value looks funny to me...
        - ClassWeb shows "Periodicals.Societies.Serials" > "LC subject correlation" >
        > TD419   
           Water—Pollution—Periodicals [Topical] (2)  
           Water—Pollution—Juvenile literature [Topical] (1)  
           Coastal ecology—Congresses [Topical] (1)  
           Water—Pollution—Congresses [Topical] (1)  
           Refuse and refuse disposal—Congresses [Topical] (1)  
           Water—Pollution—United States [Topical] (1)  
           Nonpoint source pollution—Congresses [Topical] (1)  
           Sewage—Purification—Fixed-film biological process—Congresses [Topical] (1)  

##### 3. Wood is Good:
  - **OCLC no**
    - 971542226
      - One English-language record gives "[electronic resource]" in the search-result column name
      - Two other eng-lan records, I'm choosing the one with more info in it
  - **ClassWeb**
    - ` 050 | | 4 | TA419`
    - Interestingly, I don't see any TA419 in ClassWeb. [Everything I'm looking at](https://classweb.org/min/minaret?app=Class&mod=Search&iterm=TA419-TA424.6&count=75&auto=1&menu=/Auto/&close=1) includes *something* after 419...
    - Although, a ha! I *did* find *just* 419 [here](https://classweb.org/min/minaret?app=Corr&mod=Search&count=75&auto=1&close=1&menu=/Auto/&iname=l2nh&iterm=TA419&ilabel=LC%20class%20%23%20--%3E%20LCSH%20(w%2Fnames)&time=1574121318049)
      - So what is the difference between the first and second locations in ClassWeb??
#### This week (from Theo's email)
1.	Produce Sinopia data: this is our final push to get data in Sinopia; let’s focus on this this week and create a substantial Group 0 dataset. Although quality is not the main issue in creating this dataset, do try to get values associated with the appropriate RDA properties.
2.	Start conceiving your final report on cataloging in Sinopia. You may want to do this in concert with other LDT7 members available this week. What will be the format of the report? What should it contain? How will it be produced? What can be created that can be re-used by future cataloging groups when they have to write their reports? Don’t forget the role that might be played by the Cataloging Feedback Form.
3.	Review training materials. You may want to start reviewing the training materials. Considering we need to teach others how to catalog in Sinopia (starting Nov 26) we should know these materials well. In addition, the final push to create data in Sinopia, mentioned in \#1 above, should be done with consideration of how we will instruct others to perform that task.
4.	The Sinopia cataloging page you created, that can serve as a hub for cataloging efforts, is excellent; thank you for creating that. If anything else needs to be done with that page, please do that and pass the administration of that page on to Melissa. As the administrator, she can make us all administrators able to edit that page as needed. But I think we shuld put Melissa in charge of that excellent “hub” of Sinopia cataloging at UW.
5.	SHACL validation. Please continue your work with SHACL. You have things you know you need to do, like continue work with shaclgen. What may not be as obvious is that we’d like you to continue producing SHACL validation code for additional UWL SemWeb Data; namely, WebResource and SourceResource. Assuming that you’ve completed Aggregation and Agent. Melissa and Emmaline can do Collection and Rights.
6.	Ben and Melissa might like a little assistance with Sinopia.
7.	Anything Ben or Crystal specifically ask for can be prioritized.
### 20191115
#### Next week--Theo out of town
![2019111502](https://github.com/briesenberg07/libraryNotes/blob/master/images/2019111502.jpg)
![](https://github.com/briesenberg07/libraryNotes/blob/master/images/)
### 20191114
#### Libraries Council meeting
![20191114182140138_00012](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191114182140138_00012.jpg)
![20191115154123050_000133](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191115154123050_000133.jpg)
#### UWL Digital Scholarship Collective meeting
See:
- [Agenda](https://docs.google.com/document/d/1ZvZ7Qa6T7WAbdX0kg-RExmlRSR7LGmfJ6M0fJwhi0c0/edit#)
- [DRAFT Goals and Outcomes for DS Tools & Infrastructure Pilot](https://docs.google.com/document/d/1Ar_AFknSPcKSxbjtXDAhImEPI8bARy0LROX08bTkeL0/edit)
- Also:
   - [Charges for three Digital Scholarship Groups - For Review](https://docs.google.com/document/d/1QT0dtX9ucJDjVEfh5EmUjrCF6zm2VRaltw9okmSnkG4/edit)  
**Notes:**
- Defining the "pilot": The pilot really is kind of tool-defined--it is a pilot of the Reclaim Hosting tools
   - But some pushback--we should include other platforms!
   - Point was made: Let's remember this is a pilot; people should use more permanent library infrastructure where appropriate
- iSchool capstone group of 4 students! Looking at Scalar "digital book-publishing platform"
- Looking at DRAFT Goals for pilot project:
   - It is going to be important to define specific outcomes we want--to think "what would success/impact look like?"
   - [Today's feedback on goals](https://docs.google.com/document/d/1DoPpmyxJhlqsKUtlq7MwnWHHFETcqvbp2iVwIfWEKlw/edit)
   - An idea for outcomes: What if we started every sentence with "Faculty and students would be able to..."
   - Lots and lots (to me) of talk about "documentation"...
     - In different contexts in goals, what are we talking about? Documentation of what? Who is the audience?
   - What do we think about the goals? For example, do we *know* that we want to become a "hub for a vibrant digital scholarship community across the three campuses"?
     - Maybe take a step back and think in concrete terms about what would make this a successful **pilot** program?

### 20191112
#### Cataloging training / notes
![20191112152256448_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191112152256448_0001.jpg)
![20191113170140777_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191113170140777_0001.jpg)
### 20191105
#### Outputting format profiles with the shell script
##### This was run on WSL / Ubuntu 18.04
- Copy the script to the directory containing Saxon
- Copy the absolute path to the directory containing the UW RDA profile
- Navigate to the directory containing Saxon
- Run the shell script, for example, running from the directory that the script is contained in: `./format-specific-profiles.sh`
- (Note that if you don't already have Java loaded you'll need to load/install it now: `sudo apt install default-jre`\*--I did this 2019-11-05)
- \* And if you hadn't recently, before installing Java, `sudo apt update`
- Run script
  - Fail:
```
Unrecognized option: -
Saxon-HE 9.9.1.5J from Saxonica
Usage: see http://www.saxonica.com/documentation/index.html#!using-xsl/commandline
Format: net.sf.saxon.Transform options params
Unrecognized option: -
Saxon-HE 9.9.1.5J from Saxonica
Usage: see http://www.saxonica.com/documentation/index.html#!using-xsl/commandline
Format: net.sf.saxon.Transform options params
Unrecognized option: -
Saxon-HE 9.9.1.5J from Saxonica
Usage: see http://www.saxonica.com/documentation/index.html#!using-xsl/commandline
Format: net.sf.saxon.Transform options params
Options available: -? -a -catalog -config -cr -diag -dtd -ea -expand -explain -export -ext -im -init -it -jit -l -lib -license -m -nogo -now -o -opt -or -outval -p -quit -r -relocate -repeat -s -sa -scmin -strip -t -T -target -TB -threads -TJ -Tlevel -Tout -TP -traceout -tree -u -val -versionmsg -warnings -x -xi -xmlversion -xsd -xsdversion -xsiloc -xsl -y
Use -XYZ:? for details of option XYZ
Params:
  param=value           Set stylesheet string parameter
  +param=filename       Set stylesheet document parameterOptions available: -? -a -catalog -config -cr -diag -dtd -ea -expand -explain -export -ext -im -init -it -jit -l -lib -license -m -nogo -now -o -opt -or -outval -p -quit -r -relocate -repeat -s -sa -scmin -strip -t -T -target -TB -threads -TJ -Tlevel -Tout -TP -traceout -tree -u -val -versionmsg -warnings -x -xi -xmlversion -xsd -xsdversion -xsiloc -xsl -y

  ?param=expression     Set stylesheet parameter using XPathUse -XYZ:? for details of option XYZ

  !param=value          Set serialization parameterParams:

  param=value           Set stylesheet string parameter
  +param=filename       Set stylesheet document parameter
  ?param=expression     Set stylesheet parameter using XPath
  !param=value          Set serialization parameter
Options available: -? -a -catalog -config -cr -diag -dtd -ea -expand -explain -export -ext -im -init -it -jit -l -lib -license -m -nogo -now -o -opt -or -outval -p -quit -r -relocate -repeat -s -sa -scmin -strip -t -T -target -TB -threads -TJ -Tlevel -Tout -TP -traceout -tree -u -val -versionmsg -warnings -x -xi -xmlversion -xsd -xsdversion -xsiloc -xsl -y
Use -XYZ:? for details of option XYZ
Params:
  param=value           Set stylesheet string parameter
  +param=filename       Set stylesheet document parameter
  ?param=expression     Set stylesheet parameter using XPath
  !param=value          Set serialization parameter
  ```
##### *We edited the script, now running from the UWLibCatProfiles folder*
  - `java -jar saxon9he.jar` --> `java net.sf.saxon.Transform`
- Copy the absolute path (the path from WSL home) to the UW RDA Profile
- Run the script--from where I am now: `scripts/format-specific-profiles.sh`
- Enter the desired format (for example, `monograph`)
- Fail:
```
scripts/format-specific-profiles.sh: line 5: net.sf.saxon.Transform: command not found
scripts/format-specific-profiles.sh: line 5: net.sf.saxon.Transform: command not found
scripts/format-specific-profiles.sh: line 5: net.sf.saxon.Transform: command not found
```
##### *Added `java` to the shell script, ran again:*
  - Fail:
```
Error: Could not find or load main class net.sf.saxon.Transform
Caused by: java.lang.ClassNotFoundException: net.sf.saxon.Transform
Error: Could not find or load main class net.sf.saxon.Transform
Caused by: java.lang.ClassNotFoundException: net.sf.saxon.Transform
Error: Could not find or load main class net.sf.saxon.Transform
Caused by: java.lang.ClassNotFoundException: net.sf.saxon.Transform
```
### Planning cataloging / training
![20191106143414009_0002](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191106143414009_0002.jpg)
![20191108122317312](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191108122317312.jpg)

#### Install Connexion
- [OCLC Connexion Client Installation](https://staff.lib.uw.edu/operations/cams/policies-procedures/oclc-setup-and-procedures/oclc-connexion-client-installation)
![20191106143414009_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191106143414009_0001.jpg)
- Seems good except I'm not sure about this:
> Open any bib record and look at the ALA character set. If the window is blank, restart your PC and then the ALA character set should be viewable.  

#### Still to do before Tuesday 12 November (1st training session)
- [OCLC Connexion Export to Alma](https://staff.lib.uw.edu/portals/ex-libris/management/oclc-connexion-export-to-alma)
- Reading:
  - [Alma Inventory (Creating Holdings, Items, and Portfolios)](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-inventory)
     - Mostly focus on holdings and items, but good to know a bit about portfolios
  - [Alma Work Orders](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-work-orders)
  - [Alma Overlay](https://staff.lib.uw.edu/operations/cams/policies-procedures/general-cataloging-procedures-and-resources/alma-overlay)

### Wikidata Affinity Group Call
#### [Zoom connection](https://stanford.zoom.us/j/204437188)
#### [Meeting Notes]( https://docs.google.com/document/d/1e09HBXcLQxGJggEjGiaurZPLt9V4DKA5jLbb9bmbFuA/edit?usp=sharing)
- **Martin Poulter**
   - Just finished residency at University of Oxford
- **Using Wikidata to describe the structure of a book**
   - Wikidata generally just tries to capture the "top two levels of FRBR: Works and their editions/translations"
   - [w.wiki/BQG](https://w.wiki/BQG): *Sample query - Check it out*
   - (Review of notability: Anything that has a page on any Wiki* platform?)
   - **Wikisource**
     - One current project is working with scans and fixing the OCR
     - This is something that I want to get involved with
     - Less stressful than Wikipedia (paraphrase); "just deciding what text is visible on page"
     - Projects with a traffic-light system: red to green, blue = problematic/complicated
     - Producing definitive electronic version of book! Sections, etc., can be bookmarked!
     - Wikisource makes use of Wikidata in a number of ways! For example, Wikisource author profile pages draw from Wikidata
     - Dictionary of National Biography (DNB) is the biggest (?) English-language accomplishment in Wikisource
     - [w.wiki/BQf](https://w.wiki/BQf): *Another sample query*
     - Wikisource really likes **biographical dictionaries**
     - The electronic edition projects also involve marking up the text!
       - Curious about this markup? Like TEI?
     - Using Google sheets to create data which is then fed into "Quick Statements" and becomes WD items/statements??
     - "it's joining up different facts to make a web that is the attraction of Wikidata"
     - [w.wiki/BQN](https://w.wiki/BQN): *Sample TIMELINE query (!?!?)*
- **Questions:**
   - Wikisource doesn't go all the way to TEI, but a Wikisource corrected transcription can play a part in the process--corrects transcription, can be exported as XML, etc.
   - Wikisource transcription work can focus more of formatting, matching appearance of scanned page, etc., than some researchers are interested in.
![20191105094935253](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191105094935253.jpg)
#### ALUW meeting
![20191104121816121_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191104121816121_0001.jpg)
### 20191101
#### QA Study Hall
- Wikidata QA will be available in Sinopia soon!
- New functionality coming: From lookup UI, link out to result resources in their full informational context!
- Important to differentiate in lookup URNs: For an agent search, for example, don't use LoC all names, use LCNAF or other names sub-authority, etc.
- Some scripts/diacritics are working (matching with results) in QA lookups and some aren't
### 20191028-29
**Today**  
- [X] Catch up on emails  
- [x] Start catching up on flagged emails
- [X] Take the climate survey
- [X] Personal Privacy and Digital Wellness session
![20191030134647427_page_0003](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191030134647427_page_0003.jpg)
![20191030134647427_page_0004](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191030134647427_page_0004.jpg)
- [X] Start work on XSLT to create human-readable (HTML) profiles
### 20191025
**Today**  
- Catching up on email
- Orientation session with Bryna Lieberman from 13:00-16:00
![20191030134647427_page_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191030134647427_page_0001.jpg)
![20191030134647427_page_0002](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191030134647427_page_0002.jpg)
- Probably not too much else  
- Met with Alexis K.M. to talk about uwlswd/SHACL work
### 20191024
#### Looking over stuff for a blog post
![20191025112600762_page_0002](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191025112600762_page_0002.jpg)
#### More to-dos and meetings
Wikipedia Edit-a-Thon meeting, SHACL group meeting  
![20191025112600762_page_0003](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191025112600762_page_0003.jpg)
### 20191023
#### [When I grow up, I want to be a Linked Data librarian - what you should learn first](https://youtu.be/8kLts4VBIHU)
- Who knew that there was such a thing as [Linked Data for Professional Education (LD4PE)](http://explore.dublincore.net/)?
 - This includes an index of competencies
- This presentation is a look at job-posting requirements for "linked-data librarians"
#### CaMS Department meeting
![20191025112600762_page_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191025112600762_page_0001.jpg)
### 20191021
#### Sinopia User Group meeting
- Search is case-insensitive  
- Search will match diacritics even when input is without  
- Default is now AND instead of OR for searches with multiple words  
- Can Search using a URI  
	- (But search will fail if no title)  
- Upgraded framework that controls how UI looks:  
	- "Things are more lined up"  
	- Fixes jumping around, moving from one column to the other  
- You can't open an RT that references an RT that is not present in Sinopia  
	- Note that error message will be at top of table, though  
- Discussion of putting lookup sources in an order  
  - "Ability to specify order of multiple lookup sources in a field"  
- Lots of discussion about the possibility of deleting profiles  
  - But what about the fact that there are no access restrictions?  
#### More git stuff
Used the following to overwrite everything on my local disk with contents from the remote repo:
```
git fetch --all
[then]
git reset --hard origin/master
```
I'll be honest about the fact that I don't really understand *how* this worked but only *that* it worked.
I also used this to sync my clone of the UW schemasProject, substituting `origin` with `upstream`.
### 20191018
Storing git credentials from the terminal  
Using [EXAMPLES](https://git-scm.com/docs/git-credential-store#_examples) from git documentation, git-credential-store - Helper to store credentials on disk  
```
$ git config credential.helper store
$ git push http://example.com/repo.git
Username: <type your username>
Password: <type your password>
[several days later]
$ git push http://example.com/repo.git
[your credentials are used automatically]
```
*Note that I used the above exactly and it worked*
### 20191016
**TODAY STUFF**  
- My to dos are all over the place. I don't really like Microsoft To Do at all. I currently have to-dos there, in Asana, in GitHub issues ([UWLibCatProfiles](https://github.com/CECSpecialistI/UWLibCatProfiles/issues)), in Outlook (flagged emails), here in these notes...
- [ ] Email Aimee in ITS about a new computer
- [ ] Email Brad Van Horne to see about a surplus lamp
- [ ] Follow up on the many comments in the [Draft Supplement to RDA...](https://docs.google.com/document/d/1SD6UdVE2PSIZ753FmZdhr4x6HQRrX6CUueZjMXQ7cDU/edit?usp=sharing)
  - Especially, if Theo made changes to the RDF file, where is the new file? Has it already been published?
- [ ] Review [SinopiaCataloging](https://sites.google.com/uw.edu/sinopiacataloging/contact)  
**To Try** from Theo  
Cool way to retrieve a “record” from Sinopia:  
Say we want to retrieve the work identified by https://trellis.development.sinopia.io/repository/washington/9c5bd9f5-1804-45bd-99ed-b6e3774c896e  
- Open a  \*nix shell; bash shell works.
- Store the URI in a variable: `sinUri=https://trellis.development.sinopia.io/repository/washington/9c5bd9f5-1804-45bd-99ed-b6e3774c896e`
- Curl the record; Sinopia, or Trellis, returns Turtle by default so no http “accept” statement is needed in the header.
- Then pipe it to sed replacing the <> with the URI stored in a var: `curl -G $sinUri | sed "s|<>|$sinUri|g"`  
*Try it!*  
- If you want to see just the default turtle, then enter the command before the pipe to sed: `curl -G $sinUri`  
*Or:*  
- `curl -G https://trellis.development.sinopia.io/repository/washington/9c5bd9f5-1804-45bd-99ed-b6e3774c896e`
- You can see that we don't have the URI -- but at the same time we know the URI.
- The end.
- Wait! I made an error: there should be angle brackets around the variable `$sinUri` in the sed substitution!
![20191018095202505_page_0006](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191018095202505_page_0006.jpg)
![20191018095202505_page_0007](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191018095202505_page_0007.jpg)
![20191022174526340_0001](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191022174526340_0001.jpg)
### 20191013
1030 - 1100 / .5    
- Read RDF Validation Ch. 5
### 2019100412
1230 - 1400 / 1.5
### 20191011
0900 - 1245 / 3.75  
1400 - 1715 / 3.25  
**Today**
- [X] Draft Draft Supplement to RDA RDF Ontology (commit [here](https://github.com/briesenberg07/bmrLIS/blob/master/uwlswdWorkspace/uwRdaSup/uwRdaSup.ttl))
- [ ] Create Edit-a-Thon email for Alexis to pass along to iOrgs
  - Registration form: http://bit.ly/2nZQL9f
  - My contact info
  - Image for use (all formats)
  - etc.
  - See [spreadsheet](https://docs.google.com/spreadsheets/d/12xWUHlL6PHJ0MLu0NYDPAvsiUMTdLJTTvvaoWw2mX_I/edit?usp=sharing) for people/orgs contacted today
### 20191010
0915 - 1230 / 3.25  
1345 - 1730 / 3.75    
### 20191009
1245 - 1715 / 4.5  
### 20191007
![20191018095202505_page_0004](https://github.com/briesenberg07/libraryNotes/blob/master/images/20191018095202505_page_0004.jpg)
### 20191006
1715 - 1800 / .75  
- Reading RDF Validation
### 20191004
0920 - 1230 / 3.25    
#### Catching up on stuff
- Wiki Edit-a-thon:
 - [X] Do I still need to assign a bitlink for the registration form? Bitlinks [for RSVP form](bit.ly/2nZQL9f) and for [Facebook event](bit.ly/30FdS6h) were created
 - [ ] Contact my people and orgs ASAP
- LD4P2:
  - [X] Send [update to team](https://uwcams.slack.com/archives/GJ7KM73UP/p1570215665004800)
- Draft Supplement to RDA RDF Ontology:
 - [ ] Finish my notes/questions on document
- SC linked data pilot project
 - [ ] ~~Will Theo go on Monday? I need to decide. Not an ideal time.~~
- Crystal's Sinopia Training Materials:
 - [Cataloging in Sinopia. Draft for Instructions](https://uwnetid-my.sharepoint.com/:w:/r/personal/egrant2_uw_edu/_layouts/15/Doc.aspx?sourcedoc=%7B38AC9108-C17B-408A-823E-01DE3A8A9716%7D&file=Cataloging%20in%20Sinopia.%20Draft%20for%20Instructions.docx&nav=eyJjIjoxODMzNzU5NTUzfQ&action=default&mobileredirect=true)
 - [Sinopia and Resource Templates Training](https://uwnetid-my.sharepoint.com/:p:/r/personal/egrant2_uw_edu/_layouts/15/Doc.aspx?sourcedoc=%7B2336973B-1B32-49EE-8A3A-47BB858C5AEF%7D&file=Sinopia%20and%20Resource%20Templates%20Training.pptx&nav=eyJzSWQiOjI2NSwiY0lkIjozNDI2OTMzNDQxLCJjb21tZW50SWQiOm51bGx9&action=edit&mobileredirect=true&cid=afa8efbe-b7a6-49ad-8119-ae4e6c87d6b9)
 - **I looked at these two today**
 - [Sinopia Cataloging Training and Demonstration](https://uwnetid-my.sharepoint.com/:p:/r/personal/egrant2_uw_edu/_layouts/15/Doc.aspx?sourcedoc=%7B3D084826-4830-485A-93B4-8674DACA336E%7D&file=Sinopia%20Cataloging%20Training%20and%20Demonstration.pptx&action=edit&mobileredirect=true)
### 20191002
sick time / 6 (9-15:30)  
### 20191001  
sick time / 4.5 / submitted  
