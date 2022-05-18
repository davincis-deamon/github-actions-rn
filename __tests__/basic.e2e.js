import wd from 'wd';
import config from './../e2e-config';

const port = 4723;
const driver = wd.promiseChainRemote('localhost', port);
jasmine.DEFAULT_TIMEOUT_INTERVAL = 60000;

const delayFor = (secs = 2) => new Promise(resolve => setTimeout(() => resolve(), secs * 1000));

describe('Simple Appium Example', () => {
  beforeAll(async () => await driver.init(config));
  afterAll(async () => await driver.quit());
  it('should toggle state', async () => {
    await delayFor(10);
    expect(await driver.hasElementByAccessibilityId('text1')).toBe(true);
  });
});
