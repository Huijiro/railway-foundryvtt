FROM felddy/foundryvtt:release

expose 30000/TCP

RUN chown -R 1000:1000 /data

ENTRYPOINT ["./entrypoint.sh"]
CMD ["resources/app/main.mjs", "--port=30000", "--headless", "--noupdate", "--dataPath=/data"]
HEALTHCHECK --start-period=3m --interval=30s --timeout=5s CMD ./check_health.sh
