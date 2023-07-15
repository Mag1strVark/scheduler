import React from 'react';
import styled from 'styled-components';

const StyledButton = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: ${props => props.padding ? props.padding : '0 16px'};
  background: ${(props) => props.colors[props.status]};
  border-radius: 5px;
  width: ${props => props.width ? props.width : 'fit-content'};
  height: ${props => props.height ? props.height : '32px'};;
  color: white;
`;

const ButtonForm = ({children, type = "button", onClick, status = "default", width = 125, height, padding}) => {

    const colors = {
        default: "#004CE3",
        notActive: "#AFBAC3",
        deleteTask: "#EB5757",
    };

    return (
        <StyledButton type={type} onClick={onClick} colors={colors} status={status} width={width} height={height} padding={padding}>
            {children}
        </StyledButton>
    );
};

export default ButtonForm;
