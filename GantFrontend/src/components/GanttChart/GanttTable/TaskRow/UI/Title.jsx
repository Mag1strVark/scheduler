import styled from 'styled-components';

export const Title = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;
  width: 50%;

  & span {
    padding-left: 8px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
`;
