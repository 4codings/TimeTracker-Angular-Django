import React from 'react'
import { Router, browserHistory, Route, IndexRoute } from 'react-router';

import Stop from './Stop'

export const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path="stops/:id" component={Stop}/>
    </Router>
  )
}

export default App
