import {createGlobalStyle} from "styled-components";


const GlobalStyles = createGlobalStyle`
  * {
    padding: 0;
    margin: 0;
    border: none;
  }

  *,
  *::before,
  *::after {
    box-sizing: border-box;
  }

  :focus,
  :active {
  }

  a:focus,
  a:active {
    /* outline: none;*/
  }

  /* Links */

  a, a:link, a:visited {
    /* color: inherit; */
    text-decoration: none;
    /* display: inline-block; */
  }

  a:hover {
    /* color: inherit; */
    text-decoration: none;
  }

  /* Common */

  aside, nav, footer, header, section, main {
    display: block;
  }

  h1, h2, h3, h4, h5, h6, p {
    font-size: inherit;
    font-weight: inherit;
  }

  ul, ul li {
    list-style: none;
  }

  img {
    vertical-align: top;
  }

  img, svg {
    max-width: 100%;
    height: auto;
  }

  address {
    font-style: normal;
  }

  /* Form */

  input, textarea, button, select {
    font-family: inherit;
    font-size: inherit;
    color: inherit;
    background-color: transparent;
    cursor: pointer;
  }

  input::-ms-clear {
    display: none;
  }

  html,body{
    background: ${props => props.theme.colors.background};
    font-size: ${props => props.theme.fontSize.regular};
    font-family: ${props => props.theme.fontFamily.font};
    font-weight: ${props => props.theme.fontWeight.regular};
  }

  ::-webkit-calendar-picker-indicator { 
    cursor: pointer;
    border-radius: 4px;
    margin-right: 12px;
    opacity: 0.7;
    margin-left: -16px;
  }

  ::-webkit-calendar-picker-indicator:hover {
    opacity: 1
  }

`

export default GlobalStyles
