import { shallow } from 'enzyme'
import fetchMock from 'fetch-mock'

import Stop from '../../app/javascript/react/components/Stop'

describe('show page test', () => {
  let component;


  beforeEach(() => {
    let stop = [
      {"id":1,"name":"El Greco","created_at":"2019-04-22T18:53:17.323Z","updated_at":"2019-04-22T18:53:17.323Z"}
    ]

    console.log(stop)
    console.log('prefetch')

    fetchMock.get('/api/v1/stops/1', {
      status: 200,
      body: stop
    });


    console.log(stop)
    console.log("Post fetch")

    component = mount(
      <Stop params={{"id":1}}/>
    )
  });

  it('should pass', () => {
    expect(component.find('.id')).toBePresent()
    expect(component.find('.name')).toBePresent()
    expect(component.state()).toEqual({ id:1, name:"El Greco",created_at:"2019-04-22T18:53:17.323Z",updated_at:"2019-04-22T18:53:17.323Z" });
    // console.log(component.find('.name').text())
  });
});
