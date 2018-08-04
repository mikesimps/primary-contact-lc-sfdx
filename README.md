# Primary Contact Lightning Component

A small lightning component making it easy to highlight who the primary contacts are for an account based on their role. This component is intended to added to an Account record page. I did this as a personal exploration into creating custom lightning components.

## Getting Started

This project is stored in Salesforce DX format, so you will need to know how to work with sfdx projects using the cli or similar tool.

### Prerequisites

You will need a tool that allows you to use the sfdx tools provided by Salesforce.

You must enable multiple account relationships for contacts

`Setup > Account Settings > Allow users to relate a contact to multiple accounts`

### Installing

A step by step series of examples that tell you how to get a development env running

1) Clone the git repo
2) Convert the source to standard Metadata format using `sfdx force:mdapi:convert` command
3) Deploy the component with `sfdx force:mdapi:deploy` command

## Deployment

To use this component, you must add it to the Account record pages

1) Navigate to edit the Lightning Page Layout (easiest way is to view an account Gear > Edit Page)
2) In the Lightning Component list, under custom there should be a component named "Primary Contact". Drag this onto the page.
3) There are two settings you can adjust based on your needs:
<br/>
    
<img align="right" src="https://user-images.githubusercontent.com/3085186/41557379-7499ddec-730b-11e8-95fa-0141762c721e.png" width="300">


**Title**: The text that will display at the top of the component (Default - "Primary Contact(s)")</li>

**Role**: The role (from the related contact list) that will be used to filter the contacts displayed. Only a single role can be used. (Default - "Decision Maker")</li>
<br/><br/><br/><br/><br/>


## Usage

This should likely be a primary part of your page. It makes it clear who you should be working with and what their contact information is.

![Deployed Example](https://user-images.githubusercontent.com/3085186/41557260-0f63cbcc-730b-11e8-9800-7a9082e4f564.png)

## Contributions

Please feel free to submit pull requests or ideas to make this better!

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
