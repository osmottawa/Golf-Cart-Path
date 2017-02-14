const fs = require('fs')
const geoip = require('geoip-lite')
const turf = require('@turf/turf')

const reader = fs.readFileSync('server.logs', 'utf-8')
const logs = reader.match( /(2017-02-[\d]+) [.\d\ :,[a-z-\]=&_%/(>)]*false ([\d\.]+)/gi)

const dates = {}
const ips = {}

for (const row of logs) {
  const log = row.match(/(2017-02-[\d]+) [.\d\ :,\[a-z-\]=&_%/\(>\)]*false ([\d\.]+)/i)
  const date = log[1]
  const ip = log[2]

  // Count Dates
  if (dates[date]) {
    dates[date] ++
  } else {
    dates[date] = 1
  }

  // Count IP
  if (ips[ip]) {
    ips[ip].properties.count ++
  } else {
    const geo = geoip.lookup(ip)
    const [lat, lng] = geo.ll
    const point = turf.point([lng, lat], geo)
    point.properties.ip = ip
    point.properties.count = 1
    ips[ip] = point
  }
}

console.log(ips)
console.log(dates)
const collection = turf.featureCollection(Object.keys(ips).map(key => ips[key]))
fs.writeFileSync('ip_locations.geojson', JSON.stringify(collection, null, 2))
fs.writeFileSync('dates.json', JSON.stringify(dates))
