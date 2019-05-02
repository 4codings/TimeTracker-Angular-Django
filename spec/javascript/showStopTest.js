import { shallow } from 'enzyme'
import fetchMock from 'fetch-mock'

import Stop from '../../app/javascript/react/components/Stop'
import Review from '../../app/javascript/react/components/Review'

describe('show page test', () => {
  let component;

  beforeEach(() => {
    let body = {
      "stop": {
        "id": 1,
        "name": "Edward Hopper",
        "created_at": "2019-04-23T16:43:36.475Z",
        "updated_at": "2019-04-23T16:43:36.475Z"
      },
      "reviews": [
        {
          "id": 1,
          "rating": 2,
          "body": "not enough pasta, too much sauce",
          "stop_id": 1,
          "up_votes": 1,
          "down_votes": 1,
          "user_id": 1,
          "created_at": "2019-04-24T19:20:15.921Z",
          "updated_at": "2019-04-24T19:20:15.921Z"
        },
        {
          "id": 3,
          "rating": 5,
          "body": "Best stop ever",
          "stop_id": 1,
          "up_votes": 3,
          "down_votes": 3,
          "user_id": 3,
          "created_at": "2019-04-24T20:44:18.854Z",
          "updated_at": "2019-04-24T20:44:18.854Z"
        },
        {
          "id": 4,
          "rating": 3,
          "body": "Don't stop here",
          "stop_id": 1,
          "up_votes": 4,
          "down_votes": 4,
          "user_id": 4,
          "created_at": "2019-04-24T20:45:34.178Z",
          "updated_at": "2019-04-24T20:45:34.178Z"
        }
      ]
    }
    fetchMock.get('/api/v1/stops/1', {
      status: 200,
      body: body
    });

    let voteBody = {vote: 1}
    fetchMock.get('/api/v1/votes/1', {
      status: 200,
      body: voteBody
    });

    fetchMock.get('/api/v1/votes/3', {
      status: 200,
      body: voteBody
    });

    fetchMock.get('/api/v1/votes/4', {
      status: 200,
      body: voteBody
    });

    component = mount(
      <Stop params={{"id":1}}/>
    )
  });

  afterEach(() => fetchMock.restore)

  it('should render a Stop Component', () => {
   expect(component.find(Stop)).toBePresent();
  });

  it('should show labels, fetch data from api and present', (done) => {
    setTimeout(() => {
      expect(component.find('.name')).toBePresent()

      expect(component.state('stop')).toEqual({
        "id": 1,
        "name": "Edward Hopper",
        "created_at": "2019-04-23T16:43:36.475Z",
        "updated_at": "2019-04-23T16:43:36.475Z"
      });
      // debugger
      expect(component.text()).toMatch(/Edward Hopper/)
      done()
    },0)
  });

  it('should render a Review Component', (done) => {
   setTimeout(() => {
     expect(component.find(Review)).toBePresent();
     done()
   },0)
  });

  it('should show pass the correct props to a review component', (done) => {
    setTimeout(() => {
      expect(component.find(Review).first().props().review).toEqual(
        {
          "id": 1,
          "rating": 2,
          "body": "not enough pasta, too much sauce",
          "stop_id": 1,
          "up_votes": 1,
          "down_votes": 1,
          "user_id": 1,
          "created_at": "2019-04-24T19:20:15.921Z",
          "updated_at": "2019-04-24T19:20:15.921Z"
        })
        done()
    },0)
  });

  it('should display review data', (done) => {
    setTimeout(() => {
      expect(component.find('.reviews')).toBePresent()
      expect(component.state('reviews')).toEqual(
        [
          {
            "id": 1,
            "rating": 2,
            "body": "not enough pasta, too much sauce",
            "stop_id": 1,
            "up_votes": 1,
            "down_votes": 1,
            "user_id": 1,
            "created_at": "2019-04-24T19:20:15.921Z",
            "updated_at": "2019-04-24T19:20:15.921Z"
          },
          {
            "id": 3,
            "rating": 5,
            "body": "Best stop ever",
            "stop_id": 1,
            "up_votes": 3,
            "down_votes": 3,
            "user_id": 3,
            "created_at": "2019-04-24T20:44:18.854Z",
            "updated_at": "2019-04-24T20:44:18.854Z"
          },
          {
            "id": 4,
            "rating": 3,
            "body": "Don't stop here",
            "stop_id": 1,
            "up_votes": 4,
            "down_votes": 4,
            "user_id": 4,
            "created_at": "2019-04-24T20:45:34.178Z",
            "updated_at": "2019-04-24T20:45:34.178Z"
          }
        ]
      );

      expect(component.find('.review').first().text()).toMatch(/Rating:2/)
      expect(component.find('.review').first().text()).toMatch(/not enough pasta, too much sauce/)
      done()
    },0)
  });
});
