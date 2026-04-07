import React from 'react'
import Page1 from './components/Section-1/Page1'
import Navbar from './components/Section-1/Navbar'
import Section2 from './components/Section-2/Section2'

const App = () => {
  return (
    <div>
      <Navbar/>
      <Page1/>
      <Section2 />
    </div>
  )
}

export default App
