import {ToastContainer} from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import theme from "./styles/theme";
import Main from "./pages/main/main";
import {ThemeProvider} from "styled-components";
import GlobalStyles from "./styles/GlobalStyles";
import {RecoilRoot} from "recoil";
import {BrowserRouter} from "react-router-dom";

const Planner = () => {
    return (
        <BrowserRouter>
        <RecoilRoot>
        <ThemeProvider theme={theme}>
            <GlobalStyles />
            <Main/>
            <ToastContainer/>
        </ThemeProvider>
        </RecoilRoot>
        </BrowserRouter>
    )
}

export default Planner
