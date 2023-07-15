import styled from 'styled-components';
import Check from '../../../../../assets/img/check.svg'

export const Right = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;
  // justify-content: flex-end;
  justify-content: ${(props) => props.place};

  // width: 200px;
  width: ${(props) => props.width};
  gap: 8px;
  height: 42px;
  //padding-right: 20px;
  
  button{
    width: 22px;
    height: 22px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease-in-out;
  }

  button:hover{
    transform: scale(1.2);
  }

  button svg {
    width: 22px;
    height: 22px;
  }

  input[type="checkbox"] {
    appearance: none;
    width: 18px;
    height: 18px;
    border: 2px solid #AFBAC3;
    border-radius: 5px;
    transition: all 0.2s ease-in-out;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 3px;
  }

  input[type="checkbox"]:checked {
    border: transparent;
  }

  input[type="checkbox"]:checked::before {
    padding: 0 2px;
    content: url(${Check});
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 5px;
    width: 18px;
    color: #fff;
    background-color: #56C568;
    background-position: center;
    transition: all 0.2s ease-in-out;
    
  }
  
  input[type="checkbox"]:hover {
    border-color: #56C568;
  }

  input[type="checkbox"]:hover:checked {
    background-color: #56C568;
  }

  input[type="checkbox"]:hover:checked::before {
    transform: scale(1.2);
  }

  input[type="checkbox"]:hover:not(:checked) {
    transform: scale(1.2);
  }

  .banner {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    right: 100%;
    top: -40px;
    left: -200px;
    height: 40px;
    background-color: #2870FF;
    color: white;
    font-size: 12px;
    padding: 2px 4px;
    border-radius: 5px;
    white-space: nowrap;
    z-index: 9999;
  }
`;
