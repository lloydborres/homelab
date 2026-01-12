import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";

function App() {
  const handleClickPortfolio = () => {
    window.open(
      "https://github.com/lloydborres/portfolio",
      "_self",
      "noopener,noreferrer",
    );
  };

  const handleClickGitHub = () => {
    window.open(
      "https://github.com/lloydborres/homelab",
      "_blank",
      "noopener,noreferrer",
    );
  };

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Welcome to my HomeLab</h1>
      <div className="card">
        <button onClick={handleClickPortfolio}>My Portfolio</button>
        <button onClick={handleClickGitHub}>GitHub Repository</button>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  );
}

export default App;
