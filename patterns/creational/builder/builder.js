class Raptor {
  constructor(build) {
    if (arguments.length === 1 && this.validateBuild(build)) {
      let specimenId = build.specimenId
      let speed = build.speed
      let plumage = build.plumage
      Object.defineProperties(this, {
        '_specimenId': {
          value: specimenId,
          writable: false
        },
        '_speed': {
          value: speed,
          writable: false
        },
        '_plumage': {
          value: plumage,
          writable: false
        }
      })
    }
  }

  validateBuild(build) {
    return (String(build.constructor) === String(Raptor.Builder))
  }

  static get Builder() {
    class Builder {
      constructor(specimenId) {
        this.specimenId = specimenId
      }

      withSpeed(speed) {
        this.speed = speed
        return this
      }

      withPlumage(plumage) {
        this.plumage = plumage
        return this
      }

      build() {
        return new Raptor(this)
      }
    }

    return Builder
  }
}

// We can call build unto our newly constructed builder object ...
let raptorBuilder1 = new Raptor.Builder('244E-C')
let raptor1 = raptorBuilder1.build()
console.log(raptor1)
// ... or pass in the builder object as an argument to Raptor.
// Your call.
let raptorBuilder2 = new Raptor.Builder('3998A-D')
let raptor2 = new Raptor(raptorBuilder2)
console.log(raptor2)

let raptor3 = new Raptor.Builder('88C')
  .withSpeed(45)
  .withPlumage('heavy')
  .build()

console.log(raptor3)
