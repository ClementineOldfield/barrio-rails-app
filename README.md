# Rails Assessment (A2-1) - Coder Academy, April 2019
## Juan Manuel Sanchez-Ortiz & Clementine Oldfield

Github Link:
https://github.com/ClementineOldfield/barrio-rails-app

## Setup instructions

TODO: Instructions

## Project Outline
```
You are to design, build, deploy and present a Ruby on Rails application (App).

You must build a two sided marketplace. This App will cater to two markets that your app brings together. For example,

- Ebay with buyers & sellers
- AirBnB with travellers & house owners
- Uber with travellers & drivers
```

---
<!-- 
Description of your project, including,
Problem definition / purpose
-->
## Problem definition / Purpose

lorem ipsum

## Functionality / features

lorem ipsum

## Tech stack

- HTML5
- CSS3
- SCSS
- Ruby on Rails
- Puma

# Design processes

## User stories

- As Georgie, I want to keep track of my neighbourhood products, to support local business.
- As Garret, I need a platform that will keep me informed of what is happening in my local community. 
- As Alfredo, I want an easy-to-use app so that my clients can easily pre-order what I sell.
- As Lucrecia, I want a transparent platform so that I can know more about local businesses and their philosophies.
- As Luke, I want a site to advertise my home-made jam.
- As Leah, I would like to buy fresh produce, eggs and milk as locally as possible.

## A workflow diagram of the user journey/s.

lorem ipsum

## Wireframes

lorem ipsum

## Database Entity Relationship Diagrams

lorem ipsum

# The Planning Process

## Database Design

### Initial ER Diagram

![Initial ER Diagram](docs/barrio-er-diagram.png)

## Project Timeline

26th: Project idea approval

26th - 28th April: Wireframing & Design
Monday 29th April: Database planning and ERD

ERD approval

30th - 4th: Functionality 
5th - 10th: Styling & Stretch Goals

Friday 10th May: App finished & Styled
11th & 12th: Bug fixing and finish documentation

### **Sunday, 12th of May: DUE @ 10pm**
-------

## Project Management
Screenshots of Trello board(s)



# Section 2.2 (Short Responses)

*1. What is the need (i.e. challenge) that you will be addressing in your project?*

*2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?*

*3. Describe the project will you be conducting and how. your App will address the needs.*

*4. Describe the network infrastructure the App may be based on.*

*5. Identify and describe the software to be used in your App.*

*6. Identify the database to be used in your App and provide a justification for your choice.*

*7. Identify and describe the production database setup (i.e. postgres instance).* 

*8. Describe the architecture of your App.*

*9. Explain the different high-level components (abstractions) in your App.*

*10. Detail any third party services that your App will use.*

*11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb). Discuss the database relations to be implemented.*

*12. Describe your project’s models in terms of the relationships (active record associations) they have with each other.*

For the user to address relationship, we had to decide between a 'one-to-one' relationship or a 'one-to-many' to allow for multiple users to live at the same address. We decided to go with a one-to-one, possibly creating duplicate addresses, to avoid any issues if/when the user decided to change their address.

*13. Provide your database schema design.*

*14. Provide User stories for your App.*

*15. Provide Wireframes for your App.*

*16. Describe the way tasks are allocated and tracked in your project.*

*17. Discuss how Agile methodology is being implemented in your project.*

*18. Provide an overview and description of your Source control process.*

*19. Provide an overview and description of your Testing process.*

*20. Discuss and analyse requirements related to information system security.*

*21. Discuss methods you will use to protect information and data.*

*22. Research what your legal obligations are in relation to handling user data.*
The information lifecycle
If you handle personal information, you should consider how you will protect personal information during the stages of its lifecycle.

Personal information security throughout the lifecycle involves:

1. considering whether it is actually necessary to collect and hold personal information in order to carry out your functions or activities
    We believe the email is the least intrusive way of logging in, rather than the mobile phone number. Furthermore, we want to ensure a minimun security, so it wouldn´t be enough
    to ask only for name and last name.
    
    Finally, address is needed so that nearby offers can be shown to the user.
    
2. planning how personal information will be handled by embedding privacy protections into the design of information handling practices

3. assessing the risks associated with the collection of the personal information due to a new act, practice, change to an existing project or as part of business as usual
    
4. taking appropriate steps and putting into place strategies to protect personal information that you hold

5. destruction or de-identification of the personal information when it is no longer needed.

To effectively protect personal information throughout its lifecycle, you will need to be aware of when and how you are collecting it and when and how you hold it. As noted above, your personal information holdings can be dynamic and change without any necessarily conscious or deliberate action.

Additionally, the lifecycle may include the passing of personal information to a third party for storage, processing or destruction.
