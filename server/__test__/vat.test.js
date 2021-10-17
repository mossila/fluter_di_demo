import getVat from '../src/getVat';

describe('Test vat value return', () => {
  it('Vat is define', () => {
    const vat = getVat(7432);
    expect(typeof vat).toBeDefined();
  });

  it('Vat is numeric', () => {
    const vat = getVat(7432);
    expect(typeof vat).toBe('number');
  });

  it('Get vat of 1000 is 65.42', () => {
    const vat = getVat(1000);
    expect(vat).toBe(65.42);
  });

  it('Get vat of 7432 is 486.21', () => {
    const vat = getVat(7432);
    expect(vat).toBe(486.21);
  });
});
