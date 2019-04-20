
2019/User_Story_Applied
=======================

.. post:: Apr 20, 2019
   :tags: booknotes, process
   :category: ComputerScience

This blog is the book notes for user story applied.

When a story is too large it is sometimes referred to as an epic.
There’s nothing wrong with making a few annotations on a story card based on a discussion. However, the conversation is the key, not the note on the story card.
The expectations are best captured in the form of the acceptance tests. The expectations are written as reminders about how to test story.
The customer team may include testers, a product manager, real users, and interaction designers.

Why does the customer write the stories?
The customer team, rather than the developers write the user stories for two primary reasons. 
First, each story must be written in the language of the business, not in technical jargon, so that the customer team can prioritize the stories for inclusion into iterations and releases. 
Second, as the primary product visionaries, the customer team is in the best position to describe the behavior of the product.

Once an iteration length has been selected, the developers will estimate how much work they’ll be able to do per iteration.

Release planning refers to determining a balance between a projected timeline and a desired set of functionality. 
Iteration planning refers to selecting stories for inclusion in this iteration.

User stories emphasize verbal rather than written communication
User stories are comprehensible by both you and the developers
User stories are the right size for planning
User stories work for iterative development
User stories encourage deferring detail until you have the best understanding you are going to have about what you really need.

A story card contains a short description of user- or customer-valued functionality
A story card is the visible part of a story, but the important parts are the conversations between the customer and developers about the story.
The customer team includes those who ensure that the software will meet the needs of its intended users. This may include testers, a product manager, real users and interaction designer.
The customer team writes the story cards because they are in the best position to express the desired features and because they must later be able to work out story details with the developers and to prioritize the stories.
Stories are prioritized based on their value to the organization
Releases and iterations are planned by placing stories into iterations
Velocity is the amount of work the developers can complete in an iteration
The sum of the estimates of the stories placed in an integration cannot exceed the velocity the developers forecast for that iteration.
If a story won’t fit in an iteration, you can split the story into two or more smaller stories
Acceptance tests validate that a story has been developed with the functionality the customer team had in mind when they wrote the story
User stories are worth using because they emphasize verbal communication, can be understood equally by you and the developers, can be used for planning iterations, work well withing an iterative development process, and because they encourage the deferring of detail

A good story is:
Independent
Negotiable
Valuable to users or customers
Estimable
Small
Testable

If we think about the story card as a reminder for the developer and customer to have a conversation, then it is useful to think of the story card as containing:
a phrase or two that act as reminders to hold the conversation
notes about issues to be resolved during the conversation

Details that have already been determined through conversations become tests. 
Tests can be noted on the back of the story card if using note cars or in whatever electronic system is being used.

Keeping in mind the distinction between user (someone who uses the software) and purchaser (someone who purchases the software), suppose a development team is building software that will be deployed across a large user base, perhaps 5,000 computers in a single company. 
The purchaser of a product like that may be very concerned that each of the 5,000 computers is using the same configuration for the software. 
This may lead to a story like “All configuration information is read from a central location.” 
Users don’t care where configuration information is stored but purchasers might.

Most customers begin writing stories themselves once they become comfortable with the concept that story cards are reminders to talk later rather than formal commitments or descriptions of specific functionality.

It is important for developers to be able to estimate (or at least take a guess at) the size of a story or the amount of time it will take to turn a story into working code. 
There are three common reasons why a story may not be estimable:
1. Developers lack domain knowledge
2. Developers lack technical knowledge
3. The story is too big
The solution for 2nd reason is to send one or more developers on what Extreme Programming calls a spike, which is a brief experiment to learn about an area of the application. 
The spike itself is always given a defined maximum amount of time (called a time-box), which allow us to estimate the spike. 
In this way an inestimable story turns into two stories: a quick spike to gather information and then a story to do the real work.

The ultimate determination of whether a story is appropriately sized is based on the team, its capabilities, and the technologies in use.

Epics typically fall into one of two categories:
The compound story
The complex story

Bug reports and user interface changes are common examples of stories that are often too small. 
A good approach for tiny stories, common among Extreme Programming teams, is to combine them into larger stories that represent from about a half-day to several days of work.

Stories must be written so as to be testable. 
successfully passing its tests proves that a story has been successfully developed. 
If the story cannot be tested, how can the developers know when they have finished coding?

On many projects, stories are written as though there is only one type of user. 
All stories are written from the perspective of that user type. 
This simplification is a fallacy and can lead a team to miss stories for users who do not fit the general model of the system’s primary user type. 
This disciplines of usage-centered design and interaction design teach us the benefits identifying user roles and personas prior to writing stories.

A user role is a collection of defining attributes that characterize a population of users and their intended interactions with the system.
We will use the following steps to identify and select a useful set of user roles:

* brainstorm an initial set of user roles
* organize the initial set
* consolidate roles
* refine the roles

Identifying user roles is a great leap forward, but for some of the more important user roles, it might be worth going one step further and creating a persona for the role. 
A persona is an imaginary representation of a user role.
persona for the role. A persona is an imaginary representation of a user role.

Most project teams consider only a single type of user. 
This leads to software that ignores the needs of at least some user types.
To avoid writing all stories from the perspective of a single user, identify the different user roles who will interact with the software.
By defining relevant attributes for each user role, you can better see the differences between roles.
Some user roles benefit from being described by personas. A persona is an imaginary representation of a user role. 
The persona is given a name, a face, and enough relevant details to make them seem real to the project members.
For some applications, extreme characters may be helpful in looking for stories that would otherwise be missed.

Agile processes also acknowledge that there is a time dimension to stories: the relevance of a story changes based on the passage of time and on what stories were added to the product in prior iterations.

However, even though we acknowledge the impossibility of writing all of the stories for a project, we should still make an initial upfront attempt to write those that we can, even if many are written at a very high level. 
One of the advantages of working with stories is that it is very easy to write them at different levels of detail.

Some of the most valuable techniques for creating a set of stories are:
User interviews
Questionnaires
Observation
Story-Writing workshops

During a story writing workshop the focus should be on quantity rather than quality. 
Even if you'll eventually keep your stories electronically, during the story-writing workshop use cards. 
Just let the ideas come and write them down.
The goal is to write as many user stories in as short a time as possible. 
This is not the time to design screens or solve problems.

Selection of appropriate user proxies can be critical to the success of the project. 
The background and motives of possible user proxies must be considered. 
A user proxy with a marketing background will approach the stories differently than will a user proxy who is a domain expert.
While domain experts are great resources, their usefulness is really dependent upon whether they are current or former users of the software type you are building.
Domain experts can be inclined to point the project toward a solution that is suitable for them but is too complex or is just plain wrong for the targeted user audience.

Customers are those who make the buying decision; they are not necessarily users of the software.
First, always remember that a real user beats a proxy any time.

Naturally, in order for programmers to benefit in this way, the acceptance tests for a story must be written before programming begins on that story. 
Tests are generally written at the following times:
whenever the customer and developers talk about the story and want to capture explicit details as part of a dedicated effort at the start of an iteration but before programming begins
whenever new tests are discovered during or after the programming of the story

With user stories it is vital that testing be viewed as part of the development process, not something that happens "after coding is done." 
Specifying tests is often a shared responsibility of a product manager and a tester. 
The product manager will bring her knowledge of the organizational goals driving the project; the tester will bring his suspicious mindset. 
At the start of an iteration they will get together and specify as many initial tests as they can think of. 
But it doesn't stop there, and it doesn't stop with them getting together once a week. 
As the details of a story are worked out, additional tests are specified.

Because working code from one iteration may be broken by development in a subsequent iteration, it is important to execute acceptance tests from all prior iterations. 
This means that executing acceptance tests gets more time consuming with each passing iteration. 
If possible, the development team should look into automating some or all of the acceptance tests.

For most systems, story testing is largely functional testing, which ensures that the applicaton functions as expected.
User interface testing, which ensures that all of the components of the user interface behave as expected
Usability testing, which is done to ensure an application that can be easily used
Performance testing, which is done to gauge how well the application will perform under various workloads
Stress testing, in which the application is subjected to extreme values of users, transactions, or anything else that may put the application under stress

On a large project, especially one with many user roles, it is sometimes difficult to even know where to begin in identifying stories. 
What I've found works best is to consider each user role and identify the goals that user has for interacting with our software.

Stories that represent a full slice of cake are to be preferred over those that do not. 
There are two reasons for this. 
First, exercising each layer of an application's architecture reduces the risk of finding last minute problems in one of the layers. 
Second, although not ideal, an application could conceivably be released for use with only partial functionality as long as the functionality that is included in the release slices all the way through the system.

A closed story is one that finishes with the achievement of a meaningful goal and that allows the user to feel she has accomplished something.

Even though constraint cards do not get estimated and scheduled into iterations like normal cards, they are still useful. 
Minimally, constraint cards can be taped to the wall where they act as reminders. 
Even better, acceptance tests can be written to ensure the constraint is not violated.

You want to keep the user interface out of your stories as long as possible

Each story was written in the following format:
I as a (role) want (function) so that (business value)

Stories are generally most readable when written for a single user.
"A Job Seeker can remove resumes." When written this way, the problem of one Job Seeker removing resumes of
others becomes more apparent, though, and the story can be further improved to "A Job Seeker can remove her own resumes."

Write in Active Voice
rather than saying "A resume can be posted
by a Job Seeker" say "A Job Seeker can post a resume."

we'll see that a story comprises
multiple tasks and that a task estimate is owned by the individual who will perform the task. 
Story estimates, however, are owned by the team for two reasons: 
First, since the team doesn't yet know who will work on the story, ownership of the story cannot be more precisely assigned than to the team collectively. 
Second, estimates derived by the team, rather than a single individual, are probably more useful.

We use the term velocity to refer to the number of story points a team completes (or expects to complete) in an iteration.

Whether or not a team programs in pairs has no impact on story point estimates. Pair programming affects the team's velocity, not their estimates.

It is frequently useful to start release planning from a product development roadmap showing the main areas of focus for the next handful of new releases.

There are many dimensions along which we can sort stories. 
Among the technical factors we can use are:
the risk that the story cannot be completed as desired (for example, with desired performance characteristics or with a novel algorithm)
the impact the story will have on other stories if deferred (we don't want to wait until the last iteration to learn that the application is to be three-tiered and multi-threaded)
Additionally, customers and users have their own set of factors they could use to sort the stories, including the following:
the desirability of the story to a broad base of users or customers
the desirability of the story to a small number of important users or customers
the cohesiveness of the story in relation to other stories (for example, a "zoom out" story may not be high priority on its own but may be treated as such because it is complementary to "zoom in," which is high priority)
Collectively, the developers have a sequence in which they would like to implement the stories, as will the customer. 
When there is a disagreement to the sequence, the customer wins. Every time.

Cost Changes Priority

Agile approaches are firmly in the camp of doing the juicy bits first. 
This allows agile projects to avoid solving risks too far in advance and allows them to defer building infrastructural code that may not be needed. 
Favoring the juicy bits also makes it possible for a project to release early, when only the highest-valued functionality is available.

Frequently the risky stories are associated with infrastructural or nonfunctional needs such as performance.

Collectively the developers and the customer select an iteration length that will work for them. 
Iteration lengths are typically from one to four weeks. 
Short iterations allow for more frequent course corrections of the project and more visibility into its progress; 
however, there is a slight overhead associated with each iteration. 
Err on the side of iterations that seem a little too short rather than ones that seem a little too long.
As much as possible, stick with a constant iteration length for the duration of the project. 
With consistent iterations, projects fall into a natural rhythm that can be beneficial to the pace of the team. 
Naturally there will be times when you need to alter the iteration length. 
For example, a team that has been using three-week iterations is asked to prepare the next version for an important tradeshow in eight weeks. 
Rather than stopping after two three-week iterations with two weeks left before the show, they can start with two normal three-week iterations and then follow those with an abbreviated two-week iteration. 
There's nothing wrong with this. 
What you want to avoid is random changes to the iteration length.

There are three ways to get an initial value for velocity:
1. Use historical values.
Use historical values.
2. Run an initial iteration and use the velocity of that iteration.
Run an initial iteration and use the velocity of that iteration.
3. Take a guess.
Take a guess.

To plan an iteration the whole team holds an iteration planning meeting. The customer as well as all of the developers (that is,
programmers, testers and others) on the team attend and participate in this meeting. Because the team will be looking at the stories in
detail, they will undoubtedly have some questions about them. They need the customer present to answer these questions.
The general sequence of activities for an iteration planning meeting is as follows:
1. Discuss a story.
Discuss a story.
2. Disaggregate the story into its constituent tasks.
Disaggregate the story into its constituent tasks.
3. One developer accepts responsibility for each task.
After all stories have been discussed and all tasks have been accepted, developers individually estimate the tasks they've
accepted to make sure they are not over-committed.
One developer accepts responsibility for each task.
After all stories have been discussed and all tasks have been accepted, developers individually estimate the tasks they've
accepted to make sure they are not over-committed.

you should not include partially completed stories when calculating velocity.
Velocity Does Not Use Actual Hours 

User Story Mapping
The talking goes better if we can externalize our thinking by drawing pictures or organizing our ides using index cards or sticky notes
The real goal of using stories is shared understanding