import { shallow } from 'enzyme'
import fetchMock from 'fetch-mock'

import Stop from '../../app/javascript/react/components/Stop'

describe('show page test', () => {
  let component;

  beforeEach(() => {
    let stop = {"id":1,"name":"El Greco","created_at":"2019-04-22T18:53:17.323Z","updated_at":"2019-04-22T18:53:17.323Z"}

    fetchMock.get('/api/v1/stops/1', {
      status: 200,
      body: stop
    });

    component = mount(
      <Stop params={{"id":1}}/>
    )
  });

  afterEach(() => fetchMock.restore)

  it('should show labels, fetch data from api and present', () => {
    setTimeout(() => {
      expect(component.find('.id')).toBePresent()
      expect(component.find('.name')).toBePresent()
      expect(component.state('stop')).toEqual({ id:1, name:"El Greco",created_at:"2019-04-22T18:53:17.323Z",updated_at:"2019-04-22T18:53:17.323Z" });
      expect(component.find('.name').text()).to.equal('El Greco')
      done()
    },0)
  });
});
//
// it('renders a list item for each item returned from the api call', (done) => {
//    setTimeout(() => {
//      expect(wrapper.find('li').length).toEqual(tasks.length)
//      expect(wrapper.find('li').text()).toEqual(tasks[0].title)
//      done()
//    }, 0)
//  })
